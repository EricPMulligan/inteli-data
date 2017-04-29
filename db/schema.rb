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

ActiveRecord::Schema.define(version: 20170429160727) do

  create_table "bureau_codes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code", null: false
  end

  create_table "contact_points", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "dataset_id", null: false
    t.string "type"
    t.string "fn",         null: false
    t.string "has_email",  null: false
    t.index ["dataset_id"], name: "index_contact_points_on_dataset_id", using: :btree
  end

# Could not dump table "datasets" because of following StandardError
#   Unknown type 'geometry' for column 'spatial'

  create_table "datasets_bureau_codes", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "dataset_id",     null: false
    t.integer "bureau_code_id", null: false
    t.index ["bureau_code_id"], name: "index_datasets_bureau_codes_on_bureau_code_id", using: :btree
    t.index ["dataset_id"], name: "index_datasets_bureau_codes_on_dataset_id", using: :btree
  end

  create_table "datasets_keywords", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "dataset_id", null: false
    t.integer "keyword_id", null: false
    t.index ["dataset_id"], name: "index_datasets_keywords_on_dataset_id", using: :btree
    t.index ["keyword_id"], name: "index_datasets_keywords_on_keyword_id", using: :btree
  end

  create_table "datasets_languages", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "dataset_id",  null: false
    t.integer "language_id", null: false
    t.index ["dataset_id"], name: "index_datasets_languages_on_dataset_id", using: :btree
    t.index ["language_id"], name: "index_datasets_languages_on_language_id", using: :btree
  end

  create_table "datasets_program_codes", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "dataset_id",      null: false
    t.integer "program_code_id", null: false
    t.index ["dataset_id"], name: "index_datasets_program_codes_on_dataset_id", using: :btree
    t.index ["program_code_id"], name: "index_datasets_program_codes_on_program_code_id", using: :btree
  end

  create_table "datasets_publishers", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "dataset_id",   null: false
    t.integer "publisher_id", null: false
    t.index ["dataset_id"], name: "index_datasets_publishers_on_dataset_id", using: :btree
    t.index ["publisher_id"], name: "index_datasets_publishers_on_publisher_id", using: :btree
  end

  create_table "datasets_themes", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "dataset_id", null: false
    t.integer "theme_id",   null: false
    t.integer "themes_id",  null: false
    t.index ["dataset_id"], name: "index_datasets_themes_on_dataset_id", using: :btree
    t.index ["themes_id"], name: "index_datasets_themes_on_themes_id", using: :btree
  end

  create_table "distributions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "dataset_id",        null: false
    t.string "type"
    t.string "access_url"
    t.string "conforms_to"
    t.string "download_url"
    t.string "described_by"
    t.string "described_by_type"
    t.string "description"
    t.string "format"
    t.string "media_type"
    t.string "title"
    t.index ["dataset_id"], name: "index_distributions_on_dataset_id", using: :btree
  end

  create_table "keywords", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "keyword", null: false
  end

  create_table "languages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "language", null: false
    t.index ["language"], name: "index_languages_on_language", unique: true, using: :btree
  end

  create_table "program_codes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "program_code", null: false
    t.index ["program_code"], name: "index_program_codes_on_program_code", unique: true, using: :btree
  end

  create_table "publishers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "parent_id", null: false
    t.string  "type"
    t.string  "name",      null: false
    t.index ["parent_id"], name: "index_publishers_on_parent_id", using: :btree
  end

  create_table "themes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_themes_on_name", unique: true, using: :btree
  end

  add_foreign_key "contact_points", "datasets", primary_key: "oid"
  add_foreign_key "datasets_bureau_codes", "bureau_codes"
  add_foreign_key "datasets_bureau_codes", "datasets", primary_key: "oid"
  add_foreign_key "datasets_keywords", "datasets", primary_key: "oid"
  add_foreign_key "datasets_keywords", "keywords"
  add_foreign_key "datasets_languages", "datasets", primary_key: "oid"
  add_foreign_key "datasets_languages", "languages"
  add_foreign_key "datasets_program_codes", "datasets", primary_key: "oid"
  add_foreign_key "datasets_program_codes", "program_codes"
  add_foreign_key "datasets_publishers", "datasets", primary_key: "oid"
  add_foreign_key "datasets_publishers", "publishers"
  add_foreign_key "datasets_themes", "datasets", primary_key: "oid"
  add_foreign_key "datasets_themes", "themes", column: "themes_id"
  add_foreign_key "distributions", "datasets", primary_key: "oid"
  add_foreign_key "publishers", "publishers", column: "parent_id"
end
