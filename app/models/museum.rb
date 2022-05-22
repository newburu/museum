class Museum < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :following_users, through: :follows, source: :user

  def followed_by?(user)
    following_users.include?(user)
  end

  def open_at_range
    "#{self.open_start_at}〜#{self.open_end_at}"
  end

end
