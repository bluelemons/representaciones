class Movimiento < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :reserva
  belongs_to :entidad
  belongs_to :saldo
  belongs_to :monto
#  belongs_to :tpago       #pago o deposito, antes del save de pagos y depositos tiene que setear este valor

  belongs_to :tdeposito   #por banco o talonario, solo para depositos

  accepts_nested_attributes_for :monto, :reject_if => lambda { |a| a[:valor].blank? }
  #validaciones
  validates :fecha, :presence => true
  validates :entidad, :presence => true
  validates :monto, :presence => true

  #validates exista plata en la cuenta cuando es un pago
  #validates que la agencia tenga la reserva y que exista la deuda.

  #scopes
  scope :baja, where(:hidden=>0)
  scope :depositos,where(:tpago_id=>1)
  scope :pagos,where(:tpago_id=>2)
  #metodos

  def checksaldo
    if ( tpago_id == 2 )
      unless ( saldo(monto.moneda) >= monto.valor )
        errors.add(:base, "Debe tener suficiente dinero para efectuar el pago")
      end
    end
  end

#  after_save :depositar
  def depositar
    if tpago_id==1
      entidad.deposit(monto)
    else
      entidad.withdraw(monto)
      if(entidad.tentidad_id == 1) #si es un pago de una agencia
        reserva.operadora.deposit(monto) #se aumenta el deposito de la operadora.
      end
    end
  end
end

