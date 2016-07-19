class Chore < ActiveRecord::Base
  validates :name, presence: true
  validates :home_id, presence: true
  belongs_to :home
  belongs_to :user

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end
  
end
