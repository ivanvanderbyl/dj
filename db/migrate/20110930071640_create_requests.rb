class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :song
      t.integer :votes, :default => 0
      t.datetime :played_at
      t.timestamps
    end
  end
end
