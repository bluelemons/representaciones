class DropAllVersionsTable < ActiveRecord::Migration

  VersionsTables = [:entidad_versions, :moneda_versions, :movimiento_versions,
     :pasajero_versions, :programa_versions, :reserva_versions,
     :tdeposito_versions, :tdoc_versions, :thabitacion_versions]

  def up
    VersionsTables.each do |table|
       drop_table table
    end
  end

  def down
    VersionsTables.each do |table|
       create_table table
    end
  end
end

