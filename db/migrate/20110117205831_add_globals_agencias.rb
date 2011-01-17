class AddGlobalsAgencias < ActiveRecord::Migration
  def self.up

    add_column :agencias, :hidden, :boolean, :default => 0
    add_column :agencias, :user_id, :integer

  end

  def self.down
    remove_column :agencias, :hidden
    remove_column :agencias, :user_id
  end
end
