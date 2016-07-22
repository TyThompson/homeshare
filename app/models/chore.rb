class Chore < ActiveRecord::Base
  validates :name, presence: true
  validates :home_id, presence: true
  validates_numericality_of :chore_xp, less_than_or_equal_to: 100 #:in => 1..99


  belongs_to :home
  belongs_to :chore_creator, class_name: 'User'
  belongs_to :chore_completer, class_name: 'User'
  belongs_to :chore_assignee, class_name: 'User'
  acts_as_votable


  def score
    self.get_upvotes.size - self.get_downvotes.size
  end

end
