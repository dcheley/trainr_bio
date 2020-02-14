class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :studios, through: :user_studios
  has_many :events, foreign_key: 'trainer_id', class_name: 'trainer_events'
  has_many :events, foreign_key: 'trainee_id', class_name: 'trainee_events'

  scope :instructor, -> { where(role: 1) }
  scope :basic, -> { where(role: 0) }

  has_secure_password

  def self.search(search)
    where("first_name ILIKE ? OR last_name ILIKE ?", "%#{search}%", "%#{search}%")
    .instructor
  end
end
