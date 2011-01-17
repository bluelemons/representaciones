class AddGlobalsTarifas < ActiveRecord::Migration
  def self.up

    add_column :tarifas, :hidden, :boolean, :default => 0
    add_column :tarifas, :user_id, :integer

  end

  def self.down
    remove_column :tarifas, :hidden
    remove_column :tarifas, :user_id
  end
end
