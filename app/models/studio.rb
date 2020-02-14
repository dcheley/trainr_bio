class Studio < ApplicationRecord
  validates :name, :location, presence: true

  has_many :users, through: :user_studios

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
    # .user
  end
end
