class Sentence < ApplicationRecord
  belongs_to :picture, inverse_of: :songs

  validates :content, presence: true
end
