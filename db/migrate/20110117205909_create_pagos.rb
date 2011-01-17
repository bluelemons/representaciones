class CreatePagos < ActiveRecord::Migration
  def self.up

    create_table :pagos do |t|
          
      t.date :fecha
          
      t.float :monto
          
      t.integer :moneda_id
      

      t.timestamps
    end
  end

  def self.down
    drop_table :pagos
  end
end
