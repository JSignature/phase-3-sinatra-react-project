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

ActiveRecord::Schema.define(version: 2022_08_09_134502) do

  create_table "clients", force: :cascade do |t|
    t.string "client_first_name"
    t.string "client_last_name"
    t.string "client_address_street"
    t.string "client_address_city"
    t.string "client_address_state"
    t.string "client_address_zip"
    t.string "client_phone"
    t.string "client_email"
    t.string "client_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.string "dog_name"
    t.string "dog_breed"
    t.string "dog_size"
    t.integer "dog_weight"
    t.string "dog_gender"
    t.string "dog_coat_length"
    t.string "dog_image"
    t.integer "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
