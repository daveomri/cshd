class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.string :password, null: false
      t.string :pic_url, default: 'https://cdn-icons-png.flaticon.com/512/1159/1159797.png?w=740&t=st=1673268974~exp=1673269574~hmac=f7ab5ed928c839e4c3866c6aeaf6e13408f1ec3b843d8cfd7cf41db49c7b0fa2'
      t.date :birth_date
      t.integer :state_id, default: 0
      t.text :bio
      t.integer :role_id, default: 0

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
