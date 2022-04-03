class Picture < ApplicationRecord
  belongs_to :museum
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  def liked_by?(user)
    liking_users.include?(user)
  end
end
