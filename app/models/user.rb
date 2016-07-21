class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :omniauthable
        #  :omniauth_providers => [:google]

        validates :email, presence: true
        has_many :user_homes
        has_many :household_chores, through: :homes, :source => :chores
        has_many :assigned_chores, class_name: 'Chore'
        has_many :created_chores, class_name: 'Chore'
        has_many :homes, through: :user_homes
        has_many :bills, :through => :homes
        has_many :lists, :through => :homes
        acts_as_voter


end
