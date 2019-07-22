class Sentence < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :favorite_contents, through: :favorites, source: :content
end
