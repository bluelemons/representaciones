class CreateOperadoras < ActiveRecord::Migration
  def self.up

    create_table :operadoras do |t|

          
      t.integer :direccion_id
      

      t.timestamps
    end
  end

  def self.down
    drop_table :operadoras
  end
end
