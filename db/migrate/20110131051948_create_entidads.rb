class CreateEntidads < ActiveRecord::Migration
  def self.up

    create_table :entidads do |t|

      t.string :calle

      t.integer :cuit

      t.string :telefono

      t.string :legajo

      t.string :email

      t.string :web

      t.integer :localidad_id

      t.string :name

      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :entidads
  end
end

