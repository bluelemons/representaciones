class Pase
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :monto, :origen_id, :destino_id, :cuentas_afectadas, :fecha

  def persisted?
    false
  end
end
