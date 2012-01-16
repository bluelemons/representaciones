class AddIndexesToReferences < ActiveRecord::Migration
  def self.up
    add_index :reservas, :programa_id
    add_index :reservas, :operadora_id
    add_index :reservas, :agency_id

    add_index :movimientos, :entidad_id
    add_index :movimientos, :reserva_id
    add_index :movimientos, :type
  end

  def self.down
    remove_index :reservas, :programa_id
    remove_index :reservas, :operadora_id
    remove_index :reservas, :agency_id

    remove_index :movimientos, :entidad_id
    remove_index :movimientos, :reserva_id
    remove_index :movimientos, :type
  end
end
