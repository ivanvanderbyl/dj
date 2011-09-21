class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :hostname, :null => false
      t.integer :port, :default => 1337
      t.boolean :online, :default => false
      t.timestamps
    end
  end
end
