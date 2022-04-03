class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :museum

  validates :museum_id, uniqueness: { scope: :user_id }
end
