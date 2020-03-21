class UserSpecialtyCategory < ApplicationRecord
  validates :user_id, :specialty_category_id, presence: true

  validates_uniqueness_of :specialty_category_id, scope: :user_id, message: "You can't select the same specialty more than once"

  belongs_to :specialty_category
  belongs_to :user
end
