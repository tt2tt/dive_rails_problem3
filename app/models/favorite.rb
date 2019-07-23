class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :picture
  belongs_to :sentence
end
