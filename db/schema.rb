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

ActiveRecord::Schema.define(:version => 20121212155307) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "status_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "description"
    t.integer  "user_id"
    t.integer  "rate_id"
    t.integer  "status_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "domains", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "status_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "domains_categories", :id => false, :force => true do |t|
    t.integer "category_id", :null => false
    t.integer "domain_id",   :null => false
  end

  add_index "domains_categories", ["category_id", "domain_id"], :name => "index_domains_categories_on_category_id_and_domain_id", :unique => true

  create_table "likes", :force => true do |t|
    t.integer  "positive"
    t.integer  "negative"
    t.integer  "user_id"
    t.integer  "rate_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rates", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "mark"
    t.integer  "domain_id"
    t.integer  "status_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_sessions", ["session_id"], :name => "index_user_sessions_on_session_id"
  add_index "user_sessions", ["updated_at"], :name => "index_user_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email",                               :null => false
    t.string   "username",            :default => "", :null => false
    t.string   "crypted_password",                    :null => false
    t.string   "password_salt",                       :null => false
    t.string   "persistence_token",                   :null => false
    t.string   "single_access_token",                 :null => false
    t.string   "perishable_token",                    :null => false
    t.string   "website"
    t.string   "twitter"
    t.string   "facebok"
    t.string   "skype"
    t.date     "birthday"
    t.string   "phone_number"
    t.text     "about_me"
    t.string   "user_type"
    t.string   "avatar_url"
    t.integer  "status_id"
    t.integer  "login_count",         :default => 0,  :null => false
    t.integer  "failed_login_count",  :default => 0,  :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

end
