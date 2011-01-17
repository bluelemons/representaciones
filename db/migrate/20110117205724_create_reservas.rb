class CreateReservas < ActiveRecord::Migration
  def self.up

    create_table :reservas do |t|
          
      t.date :fecha
          
      t.date :salida
          
      t.integer :activa
          
      t.string :reservado
          
      t.string :hotel
          
      t.integer :periodo
          
      t.string :regimen
          
      t.text :obs
          
      t.integer :thabitacion_id
          
      t.integer :programa_id
          
      t.integer :operadora_id
          
      t.integer :agencia_id
      

      t.timestamps
    end
  end

  def self.down
    drop_table :reservas
  end
end
