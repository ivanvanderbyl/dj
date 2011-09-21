class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.references :server, :null => false
      t.string :name, :null => false
      t.string :status, :default => "queued"
      t.string :url
      t.datetime :played_at
      t.timestamps
    end
  end
end
