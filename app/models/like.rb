class Like < ApplicationRecord
  belongs_to :user
  belongs_to :picture

  validates :picture_id, uniqueness: { scope: :user_id }
end
