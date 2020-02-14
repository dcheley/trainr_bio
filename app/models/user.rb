class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true
  validates_length_of :description, maximum: 150

  has_many :studios, through: :user_studios
  has_many :trainer_events, foreign_key: 'trainer_id', class_name: 'Event'
  has_many :trainee_events, foreign_key: 'trainee_id', class_name: 'Event'

  scope :instructor, -> { where(role: 1) }
  scope :basic, -> { where(role: 0) }

  has_secure_password

  def self.search(search)
    where("first_name ILIKE ? OR last_name ILIKE ?", "%#{search}%", "%#{search}%")
    .instructor
  end
end
