class Sentence < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorite_contents, through: :favorites, source: :content
end
