json.extract! content, :id, :user_id, :title, :image, :sound, :created_at, :updated_at
json.url content_url(content, format: :json)
