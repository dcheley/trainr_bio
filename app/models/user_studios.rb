class TrainerStudio < ApplicationRecord
  validates :user_id, :studio_id, presence: true

  validates_uniqueness_of :studio_id, scope: :user_id, message: "You can't favourite the same studio more than once"

  belongs_to :studio
  belongs_to :user
end
