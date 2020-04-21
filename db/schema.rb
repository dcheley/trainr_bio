# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_21_144431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "certifications", force: :cascade do |t|
    t.integer "trainer_id"
    t.string "name"
    t.string "level"
    t.string "accreditor"
    t.string "website_url"
    t.string "description"
    t.date "start_date"
    t.date "end_date"
    t.index ["trainer_id"], name: "index_certifications_on_trainer_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.time "start_time"
    t.date "date"
    t.integer "duration"
    t.integer "recurring", default: 0
    t.integer "trainer_id"
    t.integer "trainee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.float "latitude"
    t.float "longitude"
    t.index ["trainee_id"], name: "index_events_on_trainee_id"
    t.index ["trainer_id"], name: "index_events_on_trainer_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "milestones", force: :cascade do |t|
    t.integer "trainer_id"
    t.string "milestone"
    t.integer "month"
    t.integer "year"
  end

  create_table "offers", force: :cascade do |t|
    t.string "title"
    t.string "location"
    t.string "booking_url"
    t.string "other"
    t.text "description"
    t.time "start_time"
    t.date "date"
    t.integer "oldduration"
    t.integer "status"
    t.integer "oldcost"
    t.integer "trainer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cover_img_url"
    t.string "category"
    t.text "expectations"
    t.text "highlights"
    t.float "latitude"
    t.float "longitude"
    t.string "cost"
    t.string "duration"
    t.index ["trainer_id"], name: "index_offers_on_trainer_id"
  end

  create_table "practice_categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "specialty_categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "studios", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "phone"
    t.string "img_url"
    t.string "website_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "trainer_studios", force: :cascade do |t|
    t.integer "trainer_id"
    t.integer "studio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_trainer_studios_on_studio_id"
    t.index ["trainer_id"], name: "index_trainer_studios_on_trainer_id"
  end

  create_table "user_practice_categories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "practice_category_id"
    t.index ["practice_category_id"], name: "index_user_practice_categories_on_practice_category_id"
    t.index ["user_id"], name: "index_user_practice_categories_on_user_id"
  end

  create_table "user_specialty_categories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "specialty_category_id"
    t.index ["specialty_category_id"], name: "index_user_specialty_categories_on_specialty_category_id"
    t.index ["user_id"], name: "index_user_specialty_categories_on_user_id"
  end

  create_table "user_studios", force: :cascade do |t|
    t.integer "user_id"
    t.integer "studio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_user_studios_on_studio_id"
    t.index ["user_id"], name: "index_user_studios_on_user_id"
  end

  create_table "user_trainers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "trainer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trainer_id"], name: "index_user_trainers_on_trainer_id"
    t.index ["user_id"], name: "index_user_trainers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "phone"
    t.string "location"
    t.string "first_name"
    t.string "last_name"
    t.string "img_url"
    t.string "instagram_url"
    t.string "facebook_url"
    t.string "website_url"
    t.string "tik_tok_url"
    t.text "description"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "headline"
    t.text "bio"
    t.float "latitude"
    t.float "longitude"
    t.string "slug"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
