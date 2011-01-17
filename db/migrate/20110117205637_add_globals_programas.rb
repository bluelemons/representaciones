class AddGlobalsProgramas < ActiveRecord::Migration
  def self.up

    add_column :programas, :hidden, :boolean, :default => 0
    add_column :programas, :user_id, :integer

  end

  def self.down
    remove_column :programas, :hidden
    remove_column :programas, :user_id
  end
end
