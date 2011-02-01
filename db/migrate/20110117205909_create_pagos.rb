class CreatePagos < ActiveRecord::Migration
  def self.up

    create_table :pagos do |t|
          
      t.integer :entidad_id
      t.integer :reserva_id
      t.integer :movimiento_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pagos
  end
end
