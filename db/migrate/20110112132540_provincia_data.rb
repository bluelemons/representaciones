class ProvinciaData < ActiveRecord::Migration
  def self.up
    provincias=['BUENOS AIRES','CATAMARCA','CHACO','CHUBUT','CORDOBA','CORRIENTES','ENTRE RIOS','FORMOSA','JUJUY','LA PAMPA','LA RIOJA','MENDOZA','MISIONES','NEUQUEN', 'RIO NEGRO','SALTA', 'SAN JUAN', 'SAN LUIS', 'SANTA CRUZ', 'SANTA FE', 'SANTIAGO DEL ESTERO', 'TIERRA DEL FUEGO', 'TUCUMAN']
    provincias.each do |provincia|
      Provincia.create :name=>provincia
    end
  end

  def self.down
  end
end
