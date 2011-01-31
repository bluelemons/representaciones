class CreateReservas < ActiveRecord::Migration
  def self.up
    create_table :reservas do |t|
      t.date :fecha
      t.date :salida
      t.string :reservado
      t.string :operado
      t.text :hotel
      t.integer :periodo
      t.string :regimen
      t.text :obs
      t.integer :thabitacion_id
      t.integer :programa_id
      t.integer :operadora_id
      t.integer :agencia_id
      t.float :iva
      t.float :impuesto
      t.float :seguro
      t.float :monto
      t.string :referencia
      t.timestamps
    end
  end

  def self.down
    drop_table :reservas
  end
end
