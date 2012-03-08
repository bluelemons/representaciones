class RemoveCuentaIdFromMovimientos < ActiveRecord::Migration
  def up
    remove_column :movimientos, :cuenta_id
  end

  def down
    add_column :movimientos, :cuenta_id, :integer
  end
end

