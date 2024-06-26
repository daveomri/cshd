json.extract! song, :id, :name, :info, :released, :language_id, :artist_id, :song_url, :created_at, :updated_at
json.url song_url(song, format: :json)
