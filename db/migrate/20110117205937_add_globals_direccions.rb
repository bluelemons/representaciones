class AddGlobalsDireccions < ActiveRecord::Migration
  def self.up

    add_column :direccions, :hidden, :boolean, :default => 0
    add_column :direccions, :user_id, :integer

  end

  def self.down
    remove_column :direccions, :hidden
    remove_column :direccions, :user_id
  end
end
