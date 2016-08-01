class Chore < ActiveRecord::Base
  validates :name, presence: true
  validates :home_id, presence: true
  validates_numericality_of :chore_xp, less_than_or_equal_to: 100


  belongs_to :home
  belongs_to :chore_creator, class_name: 'User'
  belongs_to :chore_completer, class_name: 'User'
  belongs_to :chore_assignee, class_name: 'User'


end
