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

ActiveRecord::Schema.define(:version => 20130525195812) do

  create_table "accounts", :force => true do |t|
    t.string "account_name"
    t.string "phone"
    t.string "address_line1"
    t.string "address_line2"
    t.string "city"
    t.string "state"
    t.string "postcode"
    t.string "logo"
    t.string "category"
  end

  create_table "foods", :force => true do |t|
    t.string "status"
    t.string "user_id"
    t.string "description"
    t.string "claimant"
  end

  create_table "users", :force => true do |t|
    t.string  "email"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "account_id"
    t.string  "phone"
    t.string  "mphone"
    t.string  "fax"
    t.string  "password_digest"
    t.boolean "admin"
  end

end
