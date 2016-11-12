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

ActiveRecord::Schema.define(version: 20161024080337) do

  create_table "areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "area_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "posts_id"
    t.text     "comment",         limit: 65535
    t.integer  "like"
    t.text     "like_details",    limit: 65535
    t.integer  "dislike"
    t.text     "dislike_details", limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["posts_id"], name: "fk_rails_581572ac1f", using: :btree
    t.index ["user_id"], name: "fk_rails_03de2dc08c", using: :btree
  end

  create_table "follows", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "id_user"
    t.integer  "id_followed"
    t.integer  "follow_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "location_name"
    t.string   "address"
    t.integer  "area_id"
    t.text     "description",   limit: 65535
    t.text     "details",       limit: 65535
    t.integer  "user_id"
    t.integer  "owner_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["area_id"], name: "fk_rails_f919ce4afc", using: :btree
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "content",         limit: 65535
    t.integer  "user_id"
    t.integer  "location_id"
    t.integer  "views"
    t.integer  "like"
    t.text     "like_details",    limit: 65535
    t.integer  "dislike"
    t.text     "dislike_details", limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["location_id"], name: "fk_rails_ccec1da3aa", using: :btree
    t.index ["user_id"], name: "fk_rails_5b5ddfd518", using: :btree
  end

  create_table "reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.text     "description",    limit: 65535
    t.integer  "report_id"
    t.string   "report_id_type"
    t.boolean  "checked"
    t.boolean  "is_critical"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "role_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "service_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "protected_token"
    t.integer  "role_id"
    t.boolean  "is_active"
    t.boolean  "is_lock"
    t.string   "name"
    t.date     "birthday"
    t.string   "sex"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  add_foreign_key "comments", "posts", column: "posts_id", on_delete: :cascade
  add_foreign_key "comments", "users", on_delete: :cascade
  add_foreign_key "locations", "areas", on_delete: :cascade
  add_foreign_key "posts", "locations", on_delete: :cascade
  add_foreign_key "posts", "users", on_delete: :cascade
  add_foreign_key "users", "roles"
end
