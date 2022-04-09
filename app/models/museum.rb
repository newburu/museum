class Museum < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :following_users, through: :follows, source: :user

  def followed_by?(user)
    following_users.include?(user)
  end

end
