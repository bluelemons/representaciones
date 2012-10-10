class ChangeNumeroOnMovimientos < ActiveRecord::Migration
  def self.up
    change_column :movimientos, :numero, :string
  end

  def self.down
    change_column :movimientos, :numero, :integer
  end
end

