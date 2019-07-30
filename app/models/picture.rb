class Picture < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  validates :writing, presence: true, length: {maximum: 140}
  validates :images, presence: true

  mount_uploaders :images, ImageUploader
end
