json.extract! picture, :id, {images: []}, :created_at, :updated_at, :image_cache
json.url picture_url(picture, format: :json)
