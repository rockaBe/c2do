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

ActiveRecord::Schema.define(version: 20131206201336) do

  create_table "list_subscriptions", force: true do |t|
    t.integer  "list_id"
    t.integer  "user_id"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lists", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "sharings", force: true do |t|
    t.text     "description"
    t.integer  "shareable_id"
    t.string   "shareable_type"
    t.integer  "user_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sharings", ["recipient_id"], name: "index_sharings_on_recipient_id", using: :btree
  add_index "sharings", ["user_id", "shareable_type", "shareable_id"], name: "index_sharings_on_user_id_and_shareable_type_and_shareable_id", using: :btree
  add_index "sharings", ["user_id"], name: "index_sharings_on_user_id", using: :btree

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.string   "progress_state"
    t.string   "shared_state"
    t.datetime "predue_at"
    t.datetime "overdue_at"
    t.datetime "due_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "todo_id",          null: false
    t.integer  "creator_user_id",  null: false
    t.integer  "assigned_user_id"
    t.text     "description"
  end

  add_index "tasks", ["id", "assigned_user_id", "todo_id"], name: "todo_tasks_by_assigned_user", using: :btree
  add_index "tasks", ["id", "assigned_user_id"], name: "tasks_by_assigned_user", using: :btree
  add_index "tasks", ["id", "creator_user_id", "todo_id"], name: "todo_tasks_by_creator", using: :btree
  add_index "tasks", ["id", "creator_user_id"], name: "tasks_by_creator", using: :btree
  add_index "tasks", ["id", "todo_id"], name: "tasks_by_todo_id", using: :btree
  add_index "tasks", ["todo_id", "description"], name: "index_tasks_on_todo_id_and_description", length: {"todo_id"=>nil, "description"=>15}, using: :btree
  add_index "tasks", ["todo_id"], name: "index_tasks_on_todo_id", using: :btree

  create_table "todos", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "due_at"
    t.datetime "predue_at"
    t.datetime "overdue_at"
    t.string   "shared_state",     default: "none"
    t.string   "progress_state"
    t.integer  "list_id",                           null: false
    t.integer  "creator_user_id",                   null: false
    t.integer  "assigned_user_id"
    t.text     "description"
  end

  add_index "todos", ["assigned_user_id", "list_id"], name: "list_todos_by_assigned_user_id", using: :btree
  add_index "todos", ["assigned_user_id"], name: "index_todos_on_assigned_user_id", using: :btree
  add_index "todos", ["creator_user_id", "list_id"], name: "list_todos_by_creator_user_id", using: :btree
  add_index "todos", ["creator_user_id"], name: "index_todos_on_creator_user_id", using: :btree
  add_index "todos", ["list_id", "description"], name: "index_todos_on_list_id_and_description", length: {"list_id"=>nil, "description"=>15}, using: :btree
  add_index "todos", ["list_id"], name: "index_todos_on_list_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
