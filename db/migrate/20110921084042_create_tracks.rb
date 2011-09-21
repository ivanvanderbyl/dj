class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.references :library, :null => false
      t.references :song, :null => false
      t.integer  "bit_rate", :default => 0
      t.string   "kind",          :limit => 16
      
      t.timestamps
    end
  end
end
