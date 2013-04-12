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

ActiveRecord::Schema.define(:version => 20130411213102) do

  create_table "employee_profiles", :force => true do |t|
    t.integer  "employee_id"
    t.string   "title"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.text     "description"
    t.integer  "height"
    t.string   "food"
    t.string   "day"
    t.date     "dob"
    t.integer  "salary"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "employee_profiles", ["employee_id"], :name => "index_employee_profiles_on_employee_id"

  create_table "employees", :force => true do |t|
    t.integer  "supervisor_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "name"
  end

  add_index "employees", ["supervisor_id"], :name => "index_employees_on_supervisor_id"

  create_table "team_memberships", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "team_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "team_memberships", ["employee_id"], :name => "index_team_memberships_on_employee_id"
  add_index "team_memberships", ["team_id"], :name => "index_team_memberships_on_team_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "supervisor_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "teams", ["supervisor_id"], :name => "index_teams_on_supervisor_id"

end
