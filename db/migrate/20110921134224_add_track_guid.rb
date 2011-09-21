class AddTrackGuid < ActiveRecord::Migration
  def up
    add_column :tracks, :guid, :integer
    add_index :tracks, :guid
  end

  def down
  end
end
