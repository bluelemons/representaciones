class CreateMovimiento < ActiveRecord::Migration
  def self.up

    create_table :movimientos do |t|
          
      t.date :fecha
      t.float :monto
      t.integer :moneda_id

      t.timestamps
    end
  end

  def self.down
    drop_table :movimientos
  end
end
