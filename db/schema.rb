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

ActiveRecord::Schema.define(:version => 0) do

  create_table "stores", :force => true do |t|
    t.string    "lmaa",          :limit => 8,  :null => false
    t.string    "customer_code", :limit => 8,  :null => false
    t.string    "name",          :limit => 80, :null => false
    t.string    "address_1",     :limit => 80, :null => false
    t.string    "address_2",     :limit => 80, :null => false
    t.string    "suburb",        :limit => 40, :null => false
    t.string    "state",         :limit => 4,  :null => false
    t.string    "postcode",      :limit => 4,  :null => false
    t.timestamp "created_at",    :limit => 6
    t.timestamp "updated_at",    :limit => 6
  end

end
