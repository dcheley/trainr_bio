class Milestone < ApplicationRecord
  validates :milestone, :month, :year, :trainer_id, presence: true

  belongs_to :trainer, foreign_key: 'trainer_id', class_name: 'User'
end
