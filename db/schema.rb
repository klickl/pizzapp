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

ActiveRecord::Schema.define(version: 20150422154508) do

  create_table "composition_pizzas", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pizza_id"
    t.integer  "ingredient_id"
  end

  add_index "composition_pizzas", ["ingredient_id"], name: "index_composition_pizzas_on_ingredient_id"
  add_index "composition_pizzas", ["pizza_id"], name: "index_composition_pizzas_on_pizza_id"

  create_table "delivers", force: true do |t|
    t.integer "user_id"
    t.integer "order_group_id"
  end

  add_index "delivers", ["order_group_id"], name: "index_delivers_on_order_group_id"
  add_index "delivers", ["user_id"], name: "index_delivers_on_user_id"

  create_table "groups", force: true do |t|
    t.string  "name"
    t.string  "url_image"
    t.integer "user_id"
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id"

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "pizza_id"
  end

  add_index "likes", ["pizza_id"], name: "index_likes_on_pizza_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "notifications", force: true do |t|
    t.string  "message"
    t.string  "action"
    t.boolean "viewed"
    t.integer "user_id"
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "order_groups", force: true do |t|
    t.integer "num"
    t.date    "date"
    t.integer "group_id"
  end

  add_index "order_groups", ["group_id"], name: "index_order_groups_on_group_id"

  create_table "orders", force: true do |t|
    t.date     "date"
    t.integer  "num"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pizza_id"
    t.integer  "user_id"
    t.integer  "order_group_id"
  end

  add_index "orders", ["order_group_id"], name: "index_orders_on_order_group_id"
  add_index "orders", ["pizza_id"], name: "index_orders_on_pizza_id"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "pizzas", force: true do |t|
    t.string   "name"
    t.boolean  "is_proposed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "restaurant_id"
  end

  add_index "pizzas", ["restaurant_id"], name: "index_pizzas_on_restaurant_id"

  create_table "privileges", force: true do |t|
    t.string  "label"
    t.integer "level"
  end

  create_table "restaurants", force: true do |t|
    t.string "name"
  end

  create_table "user_groups", force: true do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  add_index "user_groups", ["group_id"], name: "index_user_groups_on_group_id"
  add_index "user_groups", ["user_id"], name: "index_user_groups_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "mail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "privilege_id"
  end

  add_index "users", ["privilege_id"], name: "index_users_on_privilege_id"

end
