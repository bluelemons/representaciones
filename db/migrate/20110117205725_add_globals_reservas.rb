class AddGlobalsReservas < ActiveRecord::Migration
  def self.up

    add_column :reservas, :hidden, :boolean, :default => 0
    add_column :reservas, :user_id, :integer

  end

  def self.down
    remove_column :reservas, :hidden
    remove_column :reservas, :user_id
  end
end
