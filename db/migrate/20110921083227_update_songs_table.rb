class UpdateSongsTable < ActiveRecord::Migration
  def up
    drop_table :songs

    create_table :songs, :force => true do |t|
      t.string 'file_location'

      t.string  'artist'
      t.string  'album'
      t.string  'name'
      t.integer 'year', :default => 0
      t.integer 'duration', :default => 0
      t.integer  "track_number", :default => 0
      t.integer  "track_count", :default => 0
      t.integer  "disc_number", :default => 0
      t.integer  "disc_count", :default => 0
      t.timestamps
    end
  end

  def down
  end
end
