class AddPersistentIdToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :persistent_id, :string
    add_index :tracks, :persistent_id, :unique => true
  end
end
