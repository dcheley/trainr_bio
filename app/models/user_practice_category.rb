class UserPracticeCategory < ApplicationRecord
  validates :user_id, :practice_category_id, presence: true

  validates_uniqueness_of :practice_category_id, scope: :user_id, message: "You can't select the same practice more than once"

  belongs_to :practice_category
  belongs_to :user
end
