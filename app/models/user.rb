class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :studios, through: :user_studios

  scope :instructor, -> { where(role: 1) }
  scope :basic, -> { where(role: 0) }

  has_secure_password

  def self.search(search)
    where("first_name ILIKE ? OR last_name ILIKE ?", "%#{search}%", "%#{search}%")
  end
end
