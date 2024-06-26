json.extract! review, :id, :user_id, :song_id, :rating, :review, :created_at, :updated_at
json.url review_url(review, format: :json)
