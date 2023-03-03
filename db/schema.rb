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

ActiveRecord::Schema.define(version: 2023_03_03_043024) do

  create_table "amenities", force: :cascade do |t|
    t.string "outlets"
    t.boolean "coffee"
    t.boolean "food"
    t.boolean "wifi"
    t.string "transit_access"
    t.string "seating"
    t.string "noise"
    t.integer "spot_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.boolean "cafe"
    t.boolean "library"
    t.boolean "hotel"
    t.boolean "public_space"
    t.boolean "mixed_use"
    t.boolean "coworking"
    t.boolean "outdoor_option"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "libraries", force: :cascade do |t|
    t.integer "user_id"
    t.integer "spot_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "region"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "northside"
    t.string "southside"
    t.string "suburbs"
    t.string "downtown"
    t.string "westside"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "review_content"
    t.string "rating"
    t.integer "user_id"
    t.string "photo"
    t.integer "spot_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spot_offerings", force: :cascade do |t|
    t.integer "spot_id"
    t.integer "amenity_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spot_types", force: :cascade do |t|
    t.integer "spot_id"
    t.integer "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spots", force: :cascade do |t|
    t.time "hours"
    t.string "traffic"
    t.string "photo"
    t.string "address"
    t.integer "region_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
