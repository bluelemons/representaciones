class CreateReservas < ActiveRecord::Migration
  def self.up
    create_table :reservas do |t|
      t.date :fecha
      t.date :salida
      t.string :reservado
      t.string :operado
      t.text :hotel
      t.string :periodo
      t.string :regimen
      t.text :obs
      t.integer :thabitacion_id
      t.integer :programa_id
      t.integer :operadora_id
      t.integer :agency_id
      t.float :iva
      t.float :impuesto
      t.float :seguro
      t.integer :monto_id
      t.string :referencia
      t.boolean :cancelada, :default =>0
      t.boolean :activa, :default =>0
      t.timestamps
    end
  end

  def self.down
    drop_table :reservas
  end
end

