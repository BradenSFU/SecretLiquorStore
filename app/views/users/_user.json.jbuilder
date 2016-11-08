json.extract! user, :id, :Username, :Password, :Password_confirmation, :Email, :Biography, :Isadmin, :created_at, :updated_at
json.url user_url(user, format: :json)
