class AddVersionateReservas < ActiveRecord::Migration

  def self.up
    Reserva.create_versioned_table
  end

  def self.down
    drop_table :reserva_versions
  end
  
end
