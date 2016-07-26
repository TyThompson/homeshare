class AuthToken < ApplicationRecord
  belongs_to :user

  scope :active, -> { where(deleted_at: nil).where(["expires_at > ?", Time.now]) }

  validates_uniqueness_of :unique_token

  def expire!
    update! deleted_at: Time.now
  end
end
