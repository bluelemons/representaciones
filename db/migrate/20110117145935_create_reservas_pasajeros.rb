class CreateReservasPasajeros < ActiveRecord::Migration
  def self.up

    create_table :pasajeros_reservas,:id=>false do |t|
          
      t.integer :reserva_id
          
      t.integer :pasajero_id
      

      t.timestamps
    end
  end

  def self.down
    drop_table :pasajeros_reservas
  end
end
