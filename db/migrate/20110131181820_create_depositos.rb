class CreateDepositos < ActiveRecord::Migration
  def self.up

    create_table :depositos do |t|
          
          
      t.integer :tpago_id
      t.integer :numero
      t.integer :entidad_id
      t.integer :movimiento_id      
      

      t.timestamps
    end
  end

  def self.down
    drop_table :depositos
  end
end
