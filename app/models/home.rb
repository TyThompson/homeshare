class Home < ActiveRecord::Base
  validates :name, presence: true
  has_and_belongs_to_many :users
  has_many :chores, :dependent => :destroy
  has_many :bills, :dependent => :destroy
  has_many :lists, :dependent => :destroy

end
