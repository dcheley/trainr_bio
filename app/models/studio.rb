class Studio < ApplicationRecord
  validates :name, presence: true

  has_many :users, through: :user_studios
end
