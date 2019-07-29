class Picture < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  validates :writing, presence: true
  validates :images, presence: true

  mount_uploaders :images, ImageUploader
end
