class RemoveHiddenFromAllTables < ActiveRecord::Migration
  def self.up
    remove_column :programas, :hidden
    remove_column :thabitacions, :hidden
    remove_column :monedas, :hidden
    remove_column :pasajeros, :hidden
    remove_column :movimientos, :hidden
    remove_column :tdocs, :hidden
    remove_column :entidads, :hidden
    remove_column :tdepositos, :hidden
  end

  def self.down
  end
end
