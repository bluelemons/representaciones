class ChangingCotizacion < ActiveRecord::Migration
  def self.up
    add_column :cotizacions, :moneda_compra, :string, :limit => 3
    add_column :cotizacions, :moneda_venta, :string, :limit => 3
    remove_column :cotizacions, :moneda_id
  end

  def self.down
    remove_column :cotizacions, :moneda_compra
    remove_column :cotizacions, :moneda_venta
  end
end

