json.extract! image, :id, :title, :description, :image_path, :byte_size, :profile_id, :listing_id, :created_at, :updated_at
json.url image_url(image, format: :json)
