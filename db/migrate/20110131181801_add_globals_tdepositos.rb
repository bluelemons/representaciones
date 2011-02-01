class AddGlobalsTdepositos < ActiveRecord::Migration
  def self.up

    add_column :tdepositos, :hidden, :boolean, :default => 0
    add_column :tdepositos, :user_id, :integer

  end

  def self.down
    remove_column :tdepositos, :hidden
    remove_column :tdepositos, :user_id
  end
end
