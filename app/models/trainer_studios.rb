class TrainerStudio < ApplicationRecord
  validates :trainer_id, :studio_id, presence: true

  validates_uniqueness_of :studio_id, scope: :trainer_id, message: "You can't register for the same studio more than once"

  belongs_to :studio
  belongs_to :trainer, class_name: "User"
end
