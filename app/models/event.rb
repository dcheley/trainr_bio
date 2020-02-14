class Event < ApplicationRecord
  validates :title, :start_time, :date, :duration, :trainer_id, presence: true

  belongs_to :users, foreign_key: 'trainer_id', class_name: 'trainer', optional: true
  belongs_to :users, foreign_key: 'trainee_id', class_name: 'trainee', optional: true

  scope :recurring, -> { where(recurring: 1) }
  scope :one_time, -> { where(recurring: 0) }
end
