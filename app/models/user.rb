class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #add ,:omniauthable for Google Omniauth integration and specificy :omniauth_providers => [:google]

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
        has_many :sent_payments, class_name: 'Payment', foreign_key: "sender_id"
        has_many :received_payments, class_name: 'Payment', foreign_key: "recipient_id"

        acts_as_voter

        has_many :auth_tokens, dependent: :destroy


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
