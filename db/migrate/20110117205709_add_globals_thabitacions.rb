class AddGlobalsThabitacions < ActiveRecord::Migration
  def self.up

    add_column :thabitacions, :hidden, :boolean, :default => 0
    add_column :thabitacions, :user_id, :integer

  end

  def self.down
    remove_column :thabitacions, :hidden
    remove_column :thabitacions, :user_id
  end
end
