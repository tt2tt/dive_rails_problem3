class Picture < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  validates :images, presence: true
  # validates_associated :sentence

  mount_uploaders :images, ImageUploader
end
