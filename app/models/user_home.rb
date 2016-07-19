class UserHome < ActiveRecord::Base
  has_many :homes, :foreign_key => :home_id
  has_many :users, :foreign_key => :user_id
end
