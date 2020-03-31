class Event < ApplicationRecord
  validates :title, :start_time, :date, :duration, :trainer_id, presence: true

  belongs_to :trainers, foreign_key: 'trainer_id', class_name: 'User', optional: true
  belongs_to :trainees, foreign_key: 'trainee_id', class_name: 'User', optional: true

  scope :recurring, -> { where(recurring: 1) }
  scope :one_time, -> { where(recurring: 0) }

  geocoded_by :location
  after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }
end
