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
  validate  :monto_final_positivo

  #
  # Asociaciones
  #
  belongs_to :tdeposito
  monetize   :monto
  monetize   :monto_final

  def format_monto
    if self.monto == self.monto_final
      self.monto_final.format
    else
      "#{self.monto.format} -> #{self.monto_final.format}"
    end
  end

  private

  def monto_final_positivo
    errors.add(:monto_final, "debe ser positivo") if monto_final.cents <= 0
  end


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

end

