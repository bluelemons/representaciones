class CreateTentidads < ActiveRecord::Migration
  def self.up

    create_table :tentidads do |t|
          
      t.string :name
      

      t.timestamps
    end
  end

  def self.down
    drop_table :tentidads
  end
end
