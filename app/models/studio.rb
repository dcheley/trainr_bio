class Studio < ApplicationRecord
  validates :name, :location, presence: true

  has_one_attached :avatar

  has_many :user_studios
  has_many :trainer_studios

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
    # .user
  end
end
