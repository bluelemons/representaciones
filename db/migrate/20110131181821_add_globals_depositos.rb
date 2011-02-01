class AddGlobalsDepositos < ActiveRecord::Migration
  def self.up

    add_column :depositos, :hidden, :boolean, :default => 0
    add_column :depositos, :user_id, :integer

  end

  def self.down
    remove_column :depositos, :hidden
    remove_column :depositos, :user_id
  end
end
