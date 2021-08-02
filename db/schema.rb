# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_02_063338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyers", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_buyers_on_profile_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "image_path"
    t.string "byte_size"
    t.bigint "profile_id", null: false
    t.bigint "listing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_images_on_listing_id"
    t.index ["profile_id"], name: "index_images_on_profile_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.float "price"
    t.string "type"
    t.string "condition"
    t.string "picture"
    t.bigint "buyer_id"
    t.bigint "seller_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buyer_id"], name: "index_listings_on_buyer_id"
    t.index ["seller_id"], name: "index_listings_on_seller_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.bigint "buyer_id"
    t.bigint "seller_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buyer_id"], name: "index_reviews_on_buyer_id"
    t.index ["seller_id"], name: "index_reviews_on_seller_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_sellers_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "buyers", "profiles"
  add_foreign_key "images", "listings"
  add_foreign_key "images", "profiles"
  add_foreign_key "listings", "buyers"
  add_foreign_key "listings", "sellers"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "buyers"
  add_foreign_key "reviews", "sellers"
  add_foreign_key "sellers", "profiles"
end
