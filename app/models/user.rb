class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and  :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
    :validatable, :confirmable, :registerable

  has_one_attached :avatar
  has_one_attached :cover
  has_one_attached :bio_pic

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :username, uniqueness: true, presence: true, on: :update, allow_blank: false
  validates_length_of :description, maximum: 250

  has_many :user_studios
  has_many :trainer_studios
  has_many :trainer_events, foreign_key: 'trainer_id', class_name: 'Event'
  has_many :trainee_events, foreign_key: 'trainee_id', class_name: 'Event'
  has_many :trainers, -> { distinct }, through: :trainer_events
  has_many :trainees, -> { distinct }, through: :trainee_events
  has_many :offers, foreign_key: 'trainer_id'
  has_many :milestones, foreign_key: 'trainer_id'
  has_many :certifications, foreign_key: 'trainer_id'
  has_many :user_practice_categories
  has_many :user_specialty_categories

  scope :trainer, -> { where(role: 1) }
  scope :basic, -> { where(role: 0) }
  scope :admin, -> { where(role: 8) }

  geocoded_by :location
  after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }

  def self.search(search)
    where("first_name ILIKE ? OR last_name ILIKE ?", "%#{search}%", "%#{search}%")
    .trainer
  end

end
