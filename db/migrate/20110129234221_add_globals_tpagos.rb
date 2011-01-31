class AddGlobalsTpagos < ActiveRecord::Migration
  def self.up

    add_column :tpagos, :hidden, :boolean, :default => 0
    add_column :tpagos, :user_id, :integer

  end

  def self.down
    remove_column :tpagos, :hidden
    remove_column :tpagos, :user_id
  end
end
