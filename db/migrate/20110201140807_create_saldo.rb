class CreateSaldo < ActiveRecord::Migration
  def self.up

    create_table :saldo do |t|
          
      t.float :monto
      t.integer :moneda_id

      t.timestamps
    end
  end

  def self.down
    drop_table :movimientos
  end
end
