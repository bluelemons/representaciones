class CreateDepartamentos < ActiveRecord::Migration
  def self.up
    create_table :departamentos do |t|
      t.string :name
      t.integer :provincia_id

      t.timestamps
    end
  end

  def self.down
    drop_table :departamentos
  end
end
