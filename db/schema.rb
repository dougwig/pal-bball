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

ActiveRecord::Schema.define(:version => 20110327161025) do

  create_table "signups", :force => true do |t|
    t.string   "team_sex"
    t.string   "coach_name"
    t.string   "coach_phone"
    t.string   "coach_address"
    t.string   "coach_email"
    t.string   "player1_name"
    t.string   "player1_address"
    t.string   "player1_phone"
    t.string   "player1_email"
    t.integer  "player1_dob_month"
    t.integer  "player1_dob_day"
    t.integer  "player1_dob_year"
    t.string   "player2_name"
    t.string   "player2_address"
    t.string   "player2_phone"
    t.string   "player2_email"
    t.integer  "player2_dob_month"
    t.integer  "player2_dob_day"
    t.integer  "player2_dob_year"
    t.string   "player3_name"
    t.string   "player3_address"
    t.string   "player3_phone"
    t.string   "player3_email"
    t.integer  "player3_dob_month"
    t.integer  "player3_dob_day"
    t.integer  "player3_dob_year"
    t.string   "player4_name"
    t.string   "player4_address"
    t.string   "player4_phone"
    t.string   "player4_email"
    t.integer  "player4_dob_month"
    t.integer  "player4_dob_day"
    t.integer  "player4_dob_year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
  end

end
