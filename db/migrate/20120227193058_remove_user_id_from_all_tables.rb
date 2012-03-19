class RemoveUserIdFromAllTables < ActiveRecord::Migration
  def self.up
    remove_column :programas, :user_id
    remove_column :thabitacions, :user_id
    remove_column :reservas, :user_id
    remove_column :monedas, :user_id
    remove_column :pasajeros, :user_id
    remove_column :movimientos, :user_id
    remove_column :tdocs, :user_id
    remove_column :entidads, :user_id
    remove_column :tdepositos, :user_id
  end

  def self.down
  end
end
