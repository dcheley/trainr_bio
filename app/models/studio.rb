class Studio < ApplicationRecord
  validates :name, :location, presence: true

  has_one_attached :avatar

  has_many :user_studios
  has_many :trainer_studios

  geocoded_by :location
  after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
    # .user
  end
end
