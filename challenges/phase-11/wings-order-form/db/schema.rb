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

ActiveRecord::Schema.define(version: 20151214003528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flavors", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "order_flavors", force: :cascade do |t|
    t.integer "wing_order_id", null: false
    t.integer "flavor_id",     null: false
  end

  create_table "wing_orders", force: :cascade do |t|
    t.string  "customer_name",                  null: false
    t.string  "city",                           null: false
    t.string  "state",                          null: false
    t.integer "quantity",                       null: false
    t.boolean "ranch_dressing", default: false, null: false
  end

end
