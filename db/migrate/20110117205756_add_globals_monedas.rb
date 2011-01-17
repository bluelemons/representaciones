class AddGlobalsMonedas < ActiveRecord::Migration
  def self.up

    add_column :monedas, :hidden, :boolean, :default => 0
    add_column :monedas, :user_id, :integer

  end

  def self.down
    remove_column :monedas, :hidden
    remove_column :monedas, :user_id
  end
end
