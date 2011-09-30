class RemoveUniqueIndexOnPersistentId < ActiveRecord::Migration
  def up
    remove_index :tracks, :persistent_id
    add_index :tracks, :persistent_id
  end

  def down
  end
end
