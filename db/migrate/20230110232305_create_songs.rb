class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :name, null: false
      t.text :info
      t.date :released
      t.integer :language_id, default: 0
      t.integer :artist_id, default: 0
      t.string :song_url, null: false

      t.timestamps
    end
  end
end
