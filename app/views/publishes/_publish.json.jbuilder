json.extract! publish, :id, :Rname, :image, :ingredientsList=>[], :instructions, :user_id, :drink_id, :created_at, :updated_at
json.url publish_url(publish, format: :json)
