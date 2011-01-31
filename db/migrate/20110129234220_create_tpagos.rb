class CreateTpagos < ActiveRecord::Migration
  def self.up

    create_table :tpagos do |t|
          
      t.string :name
      

      t.timestamps
    end
  end

  def self.down
    drop_table :tpagos
  end
end
