class CreatePagos < ActiveRecord::Migration
  def self.up

    create_table :movimientos do |t|

      t.integer :entidad_id
      t.integer :reserva_id
      t.integer :tpago_id
      t.integer :tdeposito_id
      t.integer :saldo_id  #es el saldo de donde se saco el dinero.
      t.integer :monto_id
      t.integer :numero
      t.date :fecha

      t.timestamps
    end
  end

  def self.down
    drop_table :movimientos
  end
end

