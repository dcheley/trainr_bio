class Offer < ApplicationRecord
  validates :title, :description, :location, :cost, :trainer_id, presence: true

  has_one_attached :avatar
  
  belongs_to :trainers, foreign_key: 'trainer_id', class_name: 'User', optional: true

  scope :hidden, -> { where(status: 1) }
  scope :active, -> { where(status: 0) }
end
