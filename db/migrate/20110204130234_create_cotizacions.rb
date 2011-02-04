class CreateCotizacions < ActiveRecord::Migration
  def self.up
    create_table :cotizacions do |t|
      t.date :fecha
      t.integer :moneda_id
      t.float :compra
      t.float :venta      

      t.timestamps
    end
  end

  def self.down
    drop_table :cotizacions
  end
end
