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

ActiveRecord::Schema.define(:version => 20110930071640) do

  create_table "libraries", :force => true do |t|
    t.string   "url",         :default => "http://localhost:1337", :null => false
    t.string   "name"
    t.boolean  "online",      :default => false
    t.datetime "imported_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", :force => true do |t|
    t.integer  "song_id"
    t.integer  "votes",      :default => 0
    t.datetime "played_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "servers", :force => true do |t|
    t.string   "hostname",                      :null => false
    t.integer  "port",       :default => 1337
    t.boolean  "online",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", :force => true do |t|
    t.string   "file_location"
    t.string   "artist"
    t.string   "album"
    t.string   "name"
    t.integer  "year"
    t.integer  "duration"
    t.integer  "bitrate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracks", :force => true do |t|
    t.integer  "library_id",                                 :null => false
    t.integer  "song_id"
    t.integer  "bit_rate",                    :default => 0
    t.string   "kind",          :limit => 16
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "persistent_id"
    t.integer  "guid"
  end

  add_index "tracks", ["guid"], :name => "index_tracks_on_guid"
  add_index "tracks", ["persistent_id"], :name => "index_tracks_on_persistent_id"

end
