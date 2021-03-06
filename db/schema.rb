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

ActiveRecord::Schema.define(version: 2019_11_28_150913) do

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

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "confirmed", default: false
    t.boolean "host_control", default: true
    t.integer "number_of_adults"
    t.integer "number_of_children"
    t.integer "number_of_infants"
    t.date "start_date"
    t.date "end_date"
    t.boolean "declined", default: false
    t.bigint "guest_id"
    t.index ["guest_id"], name: "index_bookings_on_guest_id"
    t.index ["room_id"], name: "index_bookings_on_room_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "charities", force: :cascade do |t|
    t.string "name"
    t.string "charity_number"
    t.string "address"
    t.string "email"
    t.string "phone_number"
    t.string "main_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "charity_supports", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "charity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "newsletter"
    t.index ["charity_id"], name: "index_charity_supports_on_charity_id"
    t.index ["user_id"], name: "index_charity_supports_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sender_id"
    t.integer "recipient_id"
    t.index ["recipient_id"], name: "index_chatrooms_on_recipient_id"
    t.index ["sender_id", "recipient_id"], name: "index_chatrooms_on_sender_id_and_recipient_id", unique: true
    t.index ["sender_id"], name: "index_chatrooms_on_sender_id"
  end

  create_table "chats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.text "message"
    t.integer "chatroom_id"
    t.boolean "read", default: false
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "guests", force: :cascade do |t|
    t.bigint "charity_id"
    t.string "first_name"
    t.date "date_of_birth"
    t.string "permanent_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "adult_space", default: 1
    t.integer "child_space"
    t.integer "infant_space"
    t.index ["charity_id"], name: "index_guests_on_charity_id"
  end

  create_table "residents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.date "date_of_birth"
    t.boolean "safeguarding_check?"
    t.bigint "room_id"
    t.string "gender"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_residents_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "address"
    t.integer "adult_space"
    t.integer "child_space"
    t.integer "infant_space"
    t.integer "beds"
    t.integer "max_stay_length"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.string "title"
    t.text "description"
    t.string "postcode"
    t.string "facilities"
    t.float "latitude"
    t.float "longitude"
    t.date "unavailability"
    t.boolean "public_visible", default: false
    t.text "pets"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "safeguardings", force: :cascade do |t|
    t.bigint "resident_id"
    t.bigint "user_id"
    t.boolean "approved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resident_id"], name: "index_safeguardings_on_resident_id"
    t.index ["user_id"], name: "index_safeguardings_on_user_id"
  end

  create_table "unavailabilities", force: :cascade do |t|
    t.bigint "room_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_unavailabilities_on_room_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "first_name"
    t.string "surname"
    t.text "address"
    t.text "phone_number"
    t.date "date_of_birth"
    t.text "gender"
    t.boolean "host"
    t.text "avatar_url"
    t.boolean "safeguarding_check?", default: false
    t.boolean "charity_verified?", default: false
    t.text "supported_charities"
    t.text "languages_spoken"
    t.text "employment_status"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "charity_supports", "charities"
  add_foreign_key "charity_supports", "users"
  add_foreign_key "chats", "users"
  add_foreign_key "guests", "charities"
  add_foreign_key "residents", "rooms"
  add_foreign_key "safeguardings", "residents"
  add_foreign_key "safeguardings", "users"
  add_foreign_key "unavailabilities", "rooms"
end
