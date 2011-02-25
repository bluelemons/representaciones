class CreateThabitaciones < ActiveRecord::Migration
  def self.up
    create_table :thabitaciones do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :thabitaciones
  end
end
