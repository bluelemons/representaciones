class CreateAgencias < ActiveRecord::Migration
  def self.up

    create_table :agencias do |t|
          
      t.integer :direccion_id
      

      t.timestamps
    end
  end

  def self.down
    drop_table :agencias
  end
end
