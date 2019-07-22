class User < ApplicationRecord
  has_many :pictures
  has_many :sentences
  has_many :favorites, dependent: :destroy
  has_many :favorite_pictures, through: :favorites, source: :picture

  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true, length: {maximum: 255},
                              format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  mount_uploader :profile_image, ProfileUploader

  has_secure_password
  validates :password, presence: true, length: {minimum: 6}

  before_validation {email.downcase!}
end
