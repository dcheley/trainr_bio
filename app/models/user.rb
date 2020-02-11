class User < ApplicationRecord
  validates :email, presence: true

  has_many :studios, through: :user_studios
end
