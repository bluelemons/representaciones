class AddGlobalsPagos < ActiveRecord::Migration
  def self.up

    add_column :movimientos, :hidden, :boolean, :default => 0
    add_column :movimientos, :user_id, :integer

  end

  def self.down
    remove_column :movimientos, :hidden
    remove_column :movimientos, :user_id
  end
end
