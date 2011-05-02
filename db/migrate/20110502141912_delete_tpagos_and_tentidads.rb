class DeleteTpagosAndTentidads < ActiveRecord::Migration
  # para chequear la existencia de la tabla hago esto
  class Tpago < ActiveRecord::Base ; end
  class Tentidad < ActiveRecord::Base ; end

  def self.up
    if Tpago.table_exists?
      drop_table :tpagos
      drop_table :tpago_versions
    end
    if Tentidad.table_exists?
      drop_table :tentidads
      drop_table :tentidad_versions
    end
  end

  def self.down
  end
end

