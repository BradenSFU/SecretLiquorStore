json.extract! user, :id, :Username, :Password, :Email, :Biography, :Isadmin, :created_at, :updated_at
json.url user_url(user, format: :json)
