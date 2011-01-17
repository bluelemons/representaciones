class CreateDireccions < ActiveRecord::Migration
  def self.up

    create_table :direccions do |t|
          
      t.string :direccion
          
      t.integer :cuit
          
      t.string :telefono
          
      t.string :legajo
          
      t.string :email
          
      t.string :web
          
      t.integer :localidad_id
      

      t.timestamps
    end
  end

  def self.down
    drop_table :direccions
  end
end
