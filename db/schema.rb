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

ActiveRecord::Schema[7.0].define(version: 2024_08_16_053804) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "cube"
  enable_extension "earthdistance"
  enable_extension "plpgsql"

  create_table "aquaria", force: :cascade do |t|
    t.string "name", null: false
    t.string "location", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "website"
    t.string "region"
    t.float "latitude"
    t.float "longitude"
    t.index ["name"], name: "index_aquaria_on_name", unique: true
  end

  create_table "highlights", force: :cascade do |t|
    t.string "highlight_kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "like_aquaria", id: :bigint, default: -> { "nextval('like_aquarias_id_seq'::regclass)" }, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "aquarium_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aquarium_id"], name: "index_like_aquarias_on_aquarium_id"
    t.index ["user_id", "aquarium_id"], name: "index_like_aquarias_on_user_id_and_aquarium_id", unique: true
    t.index ["user_id"], name: "index_like_aquarias_on_user_id"
  end

  create_table "replies", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "review_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_replies_on_review_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "aquaria_id", null: false
    t.text "content"
    t.bigint "target_audience_id", null: false
    t.bigint "size_rating_id", null: false
    t.bigint "highlight_id", null: false
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aquaria_id"], name: "index_reviews_on_aquaria_id"
    t.index ["highlight_id"], name: "index_reviews_on_highlight_id"
    t.index ["size_rating_id"], name: "index_reviews_on_size_rating_id"
    t.index ["target_audience_id"], name: "index_reviews_on_target_audience_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "size_ratings", force: :cascade do |t|
    t.string "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at", precision: nil
    t.string "tenant", limit: 128
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
    t.index ["tenant"], name: "index_taggings_on_tenant"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "target_audiences", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "username"
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.string "image"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "like_aquaria", "aquaria"
  add_foreign_key "like_aquaria", "users"
  add_foreign_key "replies", "reviews"
  add_foreign_key "replies", "users"
  add_foreign_key "reviews", "aquaria", column: "aquaria_id"
  add_foreign_key "reviews", "highlights"
  add_foreign_key "reviews", "size_ratings"
  add_foreign_key "reviews", "target_audiences"
  add_foreign_key "reviews", "users"
  add_foreign_key "taggings", "tags"
end
