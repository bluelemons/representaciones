class AddGlobalsTentidads < ActiveRecord::Migration
  def self.up

    add_column :tentidads, :hidden, :boolean, :default => 0
    add_column :tentidads, :user_id, :integer

  end

  def self.down
    remove_column :tentidads, :hidden
    remove_column :tentidads, :user_id
  end
end
