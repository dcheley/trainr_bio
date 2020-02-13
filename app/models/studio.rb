class Studio < ApplicationRecord
  validates :name, :location, presence: true

  has_many :users, through: :user_studios
end
