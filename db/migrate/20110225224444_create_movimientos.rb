class CreateMovimientos < ActiveRecord::Migration
  def self.up
    create_table :movimientos do |t|
      t.integer :reserva_id
      t.integer :entidad_id
      t.integer :tpago_id
      t.integer :tdeposito_id
      t.date :fecha
      t.integer :monto_id

      t.timestamps
    end
  end

  def self.down
    drop_table :movimientos
  end
end
