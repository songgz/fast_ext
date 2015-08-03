# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131217020606) do

  create_table "fast_ext_m_acl_entries", force: :cascade do |t|
    t.string   "aco_type",        limit: 60, default: ""
    t.integer  "aco_id",                     default: 0
    t.string   "aro_type",        limit: 60, default: ""
    t.integer  "aro_id",                     default: 0
    t.string   "permit",          limit: 60, default: ""
    t.string   "access_level",               default: ""
    t.string   "entity_kind",                default: ""
    t.integer  "seq",                        default: 0
    t.boolean  "actived",                    default: true
    t.integer  "createdbyorg_id",            default: 0
    t.integer  "createdby_id",               default: 0
    t.integer  "updatedby_id",               default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fast_ext_m_helps", force: :cascade do |t|
    t.string   "title",           limit: 60,                 null: false
    t.string   "print_text",      limit: 60, default: ""
    t.string   "name",            limit: 60, default: ""
    t.string   "desc",                       default: ""
    t.string   "entity_kind",                default: "app"
    t.integer  "seq",                        default: 0
    t.boolean  "is_active",                  default: true
    t.string   "note",                       default: ""
    t.integer  "createdbyorg_id",            default: 0
    t.integer  "createdby_id",               default: 0
    t.integer  "updatedby_id",               default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fast_ext_m_list_items", force: :cascade do |t|
    t.integer  "m_list_id"
    t.string   "title",           limit: 60,                 null: false
    t.string   "print_text",      limit: 60, default: ""
    t.string   "name",            limit: 60, default: ""
    t.string   "entity_kind",                default: "app"
    t.integer  "seq",                        default: 0
    t.boolean  "is_active",                  default: true
    t.string   "note",                       default: ""
    t.integer  "createdbyorg_id",            default: 0
    t.integer  "createdby_id",               default: 0
    t.integer  "updatedby_id",               default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fast_ext_m_lists", force: :cascade do |t|
    t.string   "title",           limit: 60,                 null: false
    t.string   "print_text",      limit: 60, default: ""
    t.string   "name",            limit: 60, default: ""
    t.string   "filter",                     default: ""
    t.string   "access_level",               default: "org"
    t.string   "type"
    t.string   "entity_kind",                default: "app"
    t.integer  "seq",                        default: 0
    t.boolean  "is_active",                  default: true
    t.string   "note",                       default: ""
    t.integer  "createdbyorg_id",            default: 0
    t.integer  "createdby_id",               default: 0
    t.integer  "updatedby_id",               default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fast_ext_m_menu_items", force: :cascade do |t|
    t.integer  "m_menu_id"
    t.string   "title",           limit: 60,                null: false
    t.string   "print_text",      limit: 60, default: ""
    t.string   "name",            limit: 60, default: ""
    t.string   "window",          limit: 60, default: ""
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "entity_kind",                default: ""
    t.integer  "seq",                        default: 0
    t.boolean  "is_active",                  default: true
    t.string   "note",                       default: ""
    t.integer  "createdbyorg_id",            default: 0
    t.integer  "createdby_id",               default: 0
    t.integer  "updatedby_id",               default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fast_ext_m_menus", force: :cascade do |t|
    t.string   "title",           limit: 60,                 null: false
    t.string   "print_text",      limit: 60, default: ""
    t.string   "name",            limit: 60, default: ""
    t.string   "entity_kind",                default: "app"
    t.integer  "seq",                        default: 0
    t.boolean  "is_active",                  default: true
    t.string   "note",                       default: ""
    t.integer  "createdbyorg_id",            default: 0
    t.integer  "createdby_id",               default: 0
    t.integer  "updatedby_id",               default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fast_ext_m_org_accesses", force: :cascade do |t|
    t.integer  "m_role_id"
    t.integer  "m_org_id"
    t.string   "title",           limit: 60
    t.string   "print_text",      limit: 60, default: ""
    t.string   "name",            limit: 60, default: ""
    t.string   "entity_kind",                default: "app"
    t.integer  "seq",                        default: 0
    t.boolean  "is_active",                  default: true
    t.string   "note",                       default: ""
    t.integer  "createdbyorg_id",            default: 0
    t.integer  "createdby_id",               default: 0
    t.integer  "updatedby_id",               default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fast_ext_m_orgs", force: :cascade do |t|
    t.string   "title",           limit: 60,                 null: false
    t.string   "print_text",      limit: 60, default: ""
    t.string   "name",            limit: 60, default: ""
    t.string   "type"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "entity_kind",                default: "app"
    t.integer  "seq",                        default: 0
    t.boolean  "is_active",                  default: true
    t.string   "note",                       default: ""
    t.integer  "createdbyorg_id",            default: 0
    t.integer  "createdby_id",               default: 0
    t.integer  "updatedby_id",               default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fast_ext_m_people", force: :cascade do |t|
    t.string   "title",           limit: 60,                 null: false
    t.string   "print_text",      limit: 60, default: ""
    t.string   "name",            limit: 60, default: ""
    t.string   "username",        limit: 60, default: ""
    t.string   "password_digest"
    t.string   "access_level",    limit: 60, default: "org"
    t.string   "type"
    t.string   "entity_kind",                default: "app"
    t.integer  "seq",                        default: 0
    t.boolean  "is_active",                  default: true
    t.string   "note",                       default: ""
    t.integer  "createdbyorg_id",            default: 0
    t.integer  "createdby_id",               default: 0
    t.integer  "updatedby_id",               default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fast_ext_m_person_roles", force: :cascade do |t|
    t.integer  "m_person_id"
    t.integer  "m_role_id"
    t.string   "title",           limit: 60
    t.string   "print_text",      limit: 60, default: ""
    t.string   "name",            limit: 60, default: ""
    t.string   "entity_kind",                default: "app"
    t.integer  "seq",                        default: 0
    t.boolean  "is_active",                  default: true
    t.string   "note",                       default: ""
    t.integer  "createdbyorg_id",            default: 0
    t.integer  "createdby_id",               default: 0
    t.integer  "updatedby_id",               default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fast_ext_m_roles", force: :cascade do |t|
    t.integer  "m_menu_id"
    t.string   "title",           limit: 60,                 null: false
    t.string   "print_text",      limit: 60, default: ""
    t.string   "name",            limit: 60, default: ""
    t.string   "access_level",               default: "org"
    t.string   "type"
    t.string   "entity_kind",                default: "app"
    t.integer  "seq",                        default: 0
    t.boolean  "is_active",                  default: true
    t.string   "note",                       default: ""
    t.integer  "createdbyorg_id",            default: 0
    t.integer  "createdby_id",               default: 0
    t.integer  "updatedby_id",               default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fast_ext_m_window_accesses", force: :cascade do |t|
    t.integer  "m_role_id"
    t.string   "window"
    t.string   "title",           limit: 60
    t.string   "print_text",      limit: 60, default: ""
    t.string   "name",            limit: 60, default: ""
    t.string   "entity_kind",                default: "app"
    t.integer  "seq",                        default: 0
    t.boolean  "is_active",                  default: true
    t.string   "note",                       default: ""
    t.integer  "createdbyorg_id",            default: 0
    t.integer  "createdby_id",               default: 0
    t.integer  "updatedby_id",               default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
