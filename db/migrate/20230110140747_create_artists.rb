class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :nickname, null: false
      t.string :first_name
      t.string :last_name
      t.string :pic_url
      t.date :birth_date
      t.integer :state_id, default: 0
      t.text :bio

      t.timestamps
    end
  end
end
