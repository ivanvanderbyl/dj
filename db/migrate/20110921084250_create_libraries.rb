class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :url, :null => false, :default => 'http://localhost:1337'
      t.string :name
      t.boolean :online, :default => false
      t.datetime :imported_at
      t.timestamps
    end
  end
end
