class Picture < ApplicationRecord
  belongs_to :user

  validates :images, presence: true

  mount_uploaders :images, ImageUploader
end
