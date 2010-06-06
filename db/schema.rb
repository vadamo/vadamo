# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100606023813) do

  create_table "artworks", :force => true do |t|
    t.integer  "owner_id"
    t.string   "filename"
    t.string   "thumbail"
    t.integer  "size"
    t.integer  "height"
    t.integer  "width"
    t.integer  "content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "description"
    t.string   "type"
    t.string   "subtype"
    t.string   "print"
    t.string   "style"
    t.string   "subject"
    t.text     "tags"
    t.integer  "quantity"
    t.integer  "quantity_remaining"
    t.integer  "edition_number"
    t.integer  "physical_width",     :limit => 2
    t.integer  "physical_height",    :limit => 2
    t.integer  "physical_depth",     :limit => 2
    t.integer  "physical_weight",    :limit => 2
    t.integer  "physical_framed",    :limit => 2
    t.integer  "price",              :limit => 2
    t.string   "ships_from"
    t.string   "ships_to"
    t.integer  "shipping_cost",      :limit => 2
    t.string   "name"
  end

  add_index "artworks", ["user_id"], :name => "index_artworks_on_user_id"

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.string   "body"
    t.integer  "artwork_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id"], :name => "index_microposts_on_user_id"

  create_table "pictures", :force => true do |t|
    t.integer  "user_id"
    t.integer  "artwork_id"
    t.string   "name"
    t.string   "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pictures", ["artwork_id"], :name => "index_pictures_on_artwork_id"
  add_index "pictures", ["user_id"], :name => "index_pictures_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "remember_token"
    t.boolean  "admin"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
