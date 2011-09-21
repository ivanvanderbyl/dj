class AddMakeSongIdNotNull < ActiveRecord::Migration
  def up
    change_column :tracks, :song_id, :integer, :null => true
  end

  def down
  end
end
