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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130410161550) do

  create_table "newspapers", :force => true do |t|
    t.string   "title",      :null => false
    t.integer  "editor_id",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "newspapers", ["editor_id"], :name => "index_newspapers_on_editor_id"

  create_table "subscription_plans", :force => true do |t|
    t.boolean  "is_daily",                                   :null => false
    t.integer  "newspaper_id",                               :null => false
    t.decimal  "price",        :precision => 8, :scale => 2, :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "subscription_plans", ["newspaper_id"], :name => "index_subscription_plans_on_newspaper_id"

  create_table "subscriptions", :force => true do |t|
    t.integer  "user_id",              :null => false
    t.integer  "subscription_plan_id", :null => false
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "subscriptions", ["subscription_plan_id"], :name => "index_subscriptions_on_subscription_plan_id"
  add_index "subscriptions", ["user_id"], :name => "index_subscriptions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name",          :null => false
    t.string   "email",         :null => false
    t.string   "password",      :null => false
    t.string   "session_token"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["session_token"], :name => "index_users_on_session_token", :unique => true

end
