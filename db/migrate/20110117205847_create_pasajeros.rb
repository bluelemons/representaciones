class CreatePasajeros < ActiveRecord::Migration
  def self.up

    create_table :pasajeros do |t|
          
      t.integer :doc
          
      t.string :name
          
      t.date :nacimiento
          
      t.integer :tdoc_id
      

      t.timestamps
    end
  end

  def self.down
    drop_table :pasajeros
  end
end
