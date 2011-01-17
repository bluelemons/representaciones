class AddGlobalsPasajeros < ActiveRecord::Migration
  def self.up

    add_column :pasajeros, :hidden, :boolean, :default => 0
    add_column :pasajeros, :user_id, :integer

  end

  def self.down
    remove_column :pasajeros, :hidden
    remove_column :pasajeros, :user_id
  end
end
