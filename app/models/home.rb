class Home < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :user
  has_many :chores, :dependent => :destroy
  has_many :bills, :dependent => :destroy
  has_many :lists, :dependent => :destroy

end
