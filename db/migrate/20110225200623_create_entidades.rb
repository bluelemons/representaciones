class CreateEntidades < ActiveRecord::Migration
  def self.up
    create_table :entidades do |t|
      t.string :calle
      t.integer :cuit
      t.string :telefono
      t.string :legajo
      t.string :email
      t.string :web
      t.integer :localidad_id
      t.string :name
      t.integer :tentidad_id

      t.timestamps
    end
  end

  def self.down
    drop_table :entidades
  end
end
