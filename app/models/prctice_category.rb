class PracticeCategory < ApplicationRecord
  validates :name, presence: true

  has_many :users_practice_categories
  has_many :users_specialty_categories
end
