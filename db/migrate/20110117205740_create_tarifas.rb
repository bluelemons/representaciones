class CreateTarifas < ActiveRecord::Migration
  def self.up

    create_table :tarifas do |t|
          
      t.float :iva
          
      t.integer :impuesto
          
      t.float :monto
          
      t.float :comision
          
      t.float :efectivo
          
      t.float :anticipo
          
      t.float :comision
          
      t.string :obs
          
      t.integer :reserva_id
      

      t.timestamps
    end
  end

  def self.down
    drop_table :tarifas
  end
end
