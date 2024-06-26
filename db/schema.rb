# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_11_114451) do
  create_table 'artists', force: :cascade do |t|
    t.string 'nickname', null: false
    t.string 'first_name'
    t.string 'last_name'
    t.string 'pic_url'
    t.date 'birth_date'
    t.integer 'state_id', default: 0
    t.text 'bio'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'interactions', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'languages', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'reviews', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'song_id', null: false
    t.integer 'rating'
    t.text 'review'
    t.integer 'interaction_id', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'songs', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'info'
    t.date 'released'
    t.integer 'language_id', default: 0
    t.integer 'artist_id', default: 0
    t.string 'song_url', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'states', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_states_on_name', unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username', null: false
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email', null: false
    t.string 'password', null: false
    t.string 'pic_url', default: 'https://cdn-icons-png.flaticon.com/512/1159/1159797.png?w=740&t=st=1673268974~exp=1673269574~hmac=f7ab5ed928c839e4c3866c6aeaf6e13408f1ec3b843d8cfd7cf41db49c7b0fa2'
    t.date 'birth_date'
    t.integer 'state_id', default: 0
    t.text 'bio'
    t.integer 'role_id', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
  end
end
