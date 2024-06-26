json.extract! artist, :id, :nickname, :first_name, :last_name, :pic_url, :birth_date, :state_id, :bio, :created_at, :updated_at
json.url artist_url(artist, format: :json)
