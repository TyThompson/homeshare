class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         :omniauth_providers => [:google]

        validates :email, presence: true
        has_many :user_homes
        has_many :household_chores, through: :homes, :source => :chores
        has_many :assigned_chores, class_name: 'Chore'
        has_many :created_chores, class_name: 'Chore'
        has_many :homes, through: :user_homes
        has_many :bills, :through => :homes
        has_many :lists, :through => :homes
        has_many :purchased_items, class_name: 'Item'
        has_many :created_items, class_name: 'Item'

        acts_as_voter

        has_many :auth_tokens, dependent: :destroy



  def self.from_omniauth(auth)
    uid = request.env['omniauth.auth'].uid
    user = User.where(uid: uid).first_or_create
    session[:user_id] = user.id
    redirect_to :root
  end


  def self.with_token unique_token
    token = AuthToken.active.find_by unique_token: unique_token
    token.user if token
  end

  def token_for name
    auth_tokens.active.find_by name: name
  end

  def generate_token_for name
    auth_tokens.create!(
      name:         name,
      unique_token: SecureRandom.uuid,
      expires_at:   2.weeks.from_now
    )
  end


end
