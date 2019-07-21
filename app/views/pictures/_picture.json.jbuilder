json.extract! picture, :id, {images: []}, :content, :created_at, :updated_at, :image_cache
json.url picture_url(picture, format: :json)
