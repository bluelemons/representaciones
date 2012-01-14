class Deposito < Movimiento

  #
  # Validaciones
  #
  before_validation :completar_monto


  #
  # Validaciones
  #
  validates_presence_of :tdeposito, :numero

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

  def completar_monto
    binding.pry
    if monto.zero? and monto_final.nonzero?
      self.monto = monto_final
    end
  end

end
