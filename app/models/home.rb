class Home < ActiveRecord::Base
  validates :name, presence: true
  has_many :chores, :dependent => :destroy
  has_many :bills, :dependent => :destroy
  has_many :user_homes, :dependent => :destroy
  has_one :list, :dependent => :destroy
  has_many :items, through: :lists
  belongs_to :creator, class_name: 'User'
end
