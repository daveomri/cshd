class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :song_id, null: false
      t.integer :rating
      t.text :review
      t.integer :interaction_id, default: 0

      t.timestamps
    end
  end
end
