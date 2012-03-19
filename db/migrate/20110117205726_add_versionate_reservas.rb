class AddVersionateReservas < ActiveRecord::Migration

  def self.up
    create_table :reserva_versions
  end

  def self.down
    drop_table :reserva_versions
  end

end

