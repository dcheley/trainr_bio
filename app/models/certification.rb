class Certification < ApplicationRecord
  validates :certification, :trainer_id, :name, :level, :accreditor, :website_url, :description, :start_date, :end_date, presence: true

  # has_one_attached :cert_pic

  belongs_to :trainer, foreign_key: 'trainer_id', class_name: 'User'
end
