class AddGlobalsPagos < ActiveRecord::Migration
  def self.up

    add_column :pagos, :hidden, :boolean, :default => 0
    add_column :pagos, :user_id, :integer

  end

  def self.down
    remove_column :pagos, :hidden
    remove_column :pagos, :user_id
  end
end
