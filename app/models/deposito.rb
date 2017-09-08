class Deposito < Movimiento

  #
  # Validaciones
  #
  before_validation :completar_monto


  #
  # Validaciones
  #
  validates_presence_of :tdeposito, :numero
  validate :monto_final_en_moneda_de_la_reserva

  validates :monto_final_cents, :presence => true
  validates :monto_final_currency, :presence => true

  validate :concordancia_entidad_reserva

  #
  # Asociaciones
  #
  belongs_to :tdeposito

  private

  def completar_monto
    if monto.zero? and monto_final.nonzero?
      self.monto = monto_final
    end
  end

  def monto_final_en_moneda_de_la_reserva
    if reserva and monto_final.nonzero?
      errors.add(:base, "La moneda de la reserva y del deposito no coinciden, seleccione la reserva nuevamente") unless monto_final.currency == reserva.total.currency
    end
  end

  def concordancia_entidad_reserva
    if reserva and entidad
      errors.add(:base, "La entidad y la reserva no coinciden, vuelva a seleccionar la reserva") unless entidad == reserva.agency or entidad == reserva.operadora
    end
  end

end

