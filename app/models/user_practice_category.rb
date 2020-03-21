class UserPracticeCategory < ApplicationRecord
  validates :trainer_id, :practice_category_id, presence: true

  validates_uniqueness_of :practice_category_id, scope: :trainer_id, message: "You can't select the same practice more than once"

  belongs_to :practice_category
  belongs_to :user
end
