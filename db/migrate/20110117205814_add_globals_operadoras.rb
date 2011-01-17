class AddGlobalsOperadoras < ActiveRecord::Migration
  def self.up

    add_column :operadoras, :hidden, :boolean, :default => 0
    add_column :operadoras, :user_id, :integer

  end

  def self.down
    remove_column :operadoras, :hidden
    remove_column :operadoras, :user_id
  end
end
