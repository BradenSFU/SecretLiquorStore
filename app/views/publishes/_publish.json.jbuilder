json.extract! publish, :id, :name, :image, :instructions, :user_id, :drink_id, :created_at, :updated_at
json.url publish_url(publish, format: :json)
