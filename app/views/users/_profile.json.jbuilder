json.extract! user, :id, :id, :username, :first_name, :last_name, :password, :pic_url, :birth_date, :state_id, :bio, :created_at, :updated_at
json.url user_url(user, format: :json)
