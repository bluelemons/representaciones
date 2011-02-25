class CreateCotizaciones < ActiveRecord::Migration
  def self.up
    create_table :cotizaciones do |t|
      t.date :fecha
      t.float :compra
      t.integer :moneda_id
      t.float :venta

      t.timestamps
    end
  end

  def self.down
    drop_table :cotizaciones
  end
end
