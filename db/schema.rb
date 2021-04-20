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

ActiveRecord::Schema.define(version: 2021_04_19_150055) do

  create_table "danhmucs", charset: "utf8mb4", force: :cascade do |t|
    t.text "tendanhmuc"
    t.text "imgdanhmuc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gamehavings", charset: "utf8mb4", force: :cascade do |t|
    t.text "username"
    t.integer "idgame"
    t.text "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", charset: "utf8mb4", force: :cascade do |t|
    t.text "namegame"
    t.binary "imggame", size: :long
    t.integer "coin"
    t.text "linkgame"
    t.integer "iddm"
    t.text "detailgame"
  end

  create_table "users", primary_key: "name", id: :string, charset: "utf8mb4", force: :cascade do |t|
    t.string "password_digest"
    t.text "type"
    t.binary "avatar", size: :long
    t.integer "coinhave"
    t.integer "allcoin"
    t.text "firstname"
    t.text "lastname"
    t.text "email"
    t.datetime "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
