class UpdateSongsTable < ActiveRecord::Migration
  def up
    drop_table :songs

    create_table :songs, :force => true do |t|
      t.string 'file_location'

      t.string  'artist'
      t.string  'album'
      t.string  'name'
      t.integer 'year'
      t.integer 'duration'
      t.integer :bitrate
      t.timestamps
    end
  end

  def down
  end
end
