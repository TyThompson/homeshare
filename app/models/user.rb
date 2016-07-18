class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :omniauthable
        #  :omniauth_providers => [:google]

        validates :email, presence: true
        has_many :homes
        has_many :chores
        has_many :bills
        has_many :shopping_lists

end
