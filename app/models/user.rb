class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :omniauthable
        #  :omniauth_providers => [:google]

        validates :email, presence: true
        has_and_belongs_to_many :homes
        has_many :chores, :through => :homes
        has_many :bills, :through => :homes
        has_many :lists, :through => :homes

end
