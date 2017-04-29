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

ActiveRecord::Schema.define(version: 20170429201447) do

  create_table "bureau_codes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code", null: false
  end

  create_table "contact_points", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "fn",                 null: false
    t.string "has_email",          null: false
    t.string "contact_point_type"
  end

  create_table "data_entries", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "oid",                               null: false
    t.string   "access_level",                      null: false
    t.string   "rights"
    t.string   "accrual_periodicity"
    t.string   "identifier",                        null: false
    t.datetime "issued"
    t.string   "landing_page"
    t.datetime "modified",                          null: false
    t.datetime "temporal_start"
    t.datetime "temporal_end"
    t.string   "title"
    t.string   "license"
    t.string   "is_part_of"
    t.integer  "publisher_id",                      null: false
    t.integer  "contact_point_id",                  null: false
    t.text     "description",         limit: 65535
    t.string   "data_entry_type"
    t.index ["contact_point_id"], name: "index_data_entries_on_contact_point_id", using: :btree
    t.index ["oid"], name: "index_data_entries_on_oid", unique: true, using: :btree
    t.index ["publisher_id"], name: "index_data_entries_on_publisher_id", using: :btree
  end

  create_table "data_entries_bureau_codes", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "data_entry_id",  null: false
    t.integer "bureau_code_id", null: false
    t.index ["bureau_code_id"], name: "index_data_entries_bureau_codes_on_bureau_code_id", using: :btree
    t.index ["data_entry_id"], name: "index_data_entries_bureau_codes_on_data_entry_id", using: :btree
  end

  create_table "data_entries_keywords", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "data_entry_id", null: false
    t.integer "keyword_id",    null: false
    t.index ["data_entry_id"], name: "index_data_entries_keywords_on_data_entry_id", using: :btree
    t.index ["keyword_id"], name: "index_data_entries_keywords_on_keyword_id", using: :btree
  end

  create_table "data_entries_languages", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "data_entry_id", null: false
    t.integer "language_id",   null: false
    t.index ["data_entry_id"], name: "index_data_entries_languages_on_data_entry_id", using: :btree
    t.index ["language_id"], name: "index_data_entries_languages_on_language_id", using: :btree
  end

  create_table "data_entries_program_codes", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "data_entry_id",   null: false
    t.integer "program_code_id", null: false
    t.index ["data_entry_id"], name: "index_data_entries_program_codes_on_data_entry_id", using: :btree
    t.index ["program_code_id"], name: "index_data_entries_program_codes_on_program_code_id", using: :btree
  end

  create_table "data_entries_themes", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "data_entry_id", null: false
    t.integer "theme_id",      null: false
    t.index ["data_entry_id"], name: "index_data_entries_themes_on_data_entry_id", using: :btree
    t.index ["theme_id"], name: "index_data_entries_themes_on_theme_id", using: :btree
  end

  create_table "distributions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "data_entry_id",                   null: false
    t.string "conforms_to"
    t.string "described_by"
    t.string "described_by_type"
    t.string "format"
    t.string "media_type"
    t.string "title"
    t.string "distribution_type"
    t.text   "access_url",        limit: 65535
    t.text   "download_url",      limit: 65535
    t.text   "description",       limit: 65535
    t.index ["data_entry_id"], name: "index_distributions_on_data_entry_id", using: :btree
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
    t.integer "parent_id"
    t.string  "name",           null: false
    t.string  "publisher_type"
    t.index ["parent_id"], name: "index_publishers_on_parent_id", using: :btree
  end

  create_table "themes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_themes_on_name", unique: true, using: :btree
  end

  add_foreign_key "data_entries", "contact_points"
  add_foreign_key "data_entries", "publishers"
  add_foreign_key "data_entries_bureau_codes", "bureau_codes"
  add_foreign_key "data_entries_bureau_codes", "data_entries", primary_key: "oid"
  add_foreign_key "data_entries_keywords", "data_entries", primary_key: "oid"
  add_foreign_key "data_entries_keywords", "keywords"
  add_foreign_key "data_entries_languages", "data_entries", primary_key: "oid"
  add_foreign_key "data_entries_languages", "languages"
  add_foreign_key "data_entries_program_codes", "data_entries", primary_key: "oid"
  add_foreign_key "data_entries_program_codes", "program_codes"
  add_foreign_key "data_entries_themes", "data_entries", primary_key: "oid"
  add_foreign_key "data_entries_themes", "themes"
  add_foreign_key "distributions", "data_entries", primary_key: "oid"
  add_foreign_key "publishers", "publishers", column: "parent_id"
end
