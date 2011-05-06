class Reserva < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica

#  belongs_to :pasajero #es el pasajero titular
  belongs_to :thabitacion
  belongs_to :programa
  belongs_to :monto
  accepts_nested_attributes_for :monto, :reject_if => lambda { |a| a[:valor].blank? }

  belongs_to :operadora
  belongs_to :agency
  has_many :pagos

  has_many :viajeros
  has_many :pasajeros, :through => :viajeros

  #accepts_nested_attributes_for :agencia, :reject_if => lambda { |a| a[:name].blank? }
  #accepts_nested_attributes_for :operadora, :reject_if => lambda { |a| a[:name].blank? }
  #accepts_nested_attributes_for :pasajeros, :reject_if => lambda { |a| a[:name].blank? }
  #validaciones

  validates :fecha, :presence => true
  validates :salida, :presence => true
  #validates :activa, :presence => true
  #validates :reservado, :presence => true
  #validates :hotel, :presence => true
  #validates :periodo, :presence => true
  #validates :regimen, :presence => true
  #validates :obs, :presence => true
  validates :thabitacion_id, :presence => true
  validates :programa_id, :presence => true
  validates :operadora_id, :presence => true
  validates :agency_id, :presence => true
  validates :monto, :presence => true
  #scopes

  default_scope :include => [:operadora,:monto,:agency,:programa,:thabitacion,:pagos,:pasajeros],
                :order => "id desc"

  scope :baja, where(:hidden=>0)

  scope :por_vencer, lambda {|fecha| where("fecha = ? and pago_minimo > 0",fecha) }
  search_methods :sin_voucher
  scope :sin_voucher, where("voucher is null")
  #metodos

  def titular
    pasajeros.first.try(:name)
  end

  def moneda
    try(:monto).try(:moneda).try(:simbolo)
  end

  def moneda_id
    try(:monto).try(:moneda_id)
  end
  def liquidada?
    (agencia_deuda <= 0)
  end

  def agencia_pago
    array = Array.new(4,0)

    pagos.each do |pago|
      if pago.entidad ==agency
        array[pago.monto.moneda_id]+=pago.monto.valor
        #agrego que ponga en la moneda de la reserva el pago transformado a esa moneda.
        if pago.monto.moneda_id != pago.reserva.moneda_id
          array[pago.reserva.monto.moneda_id]+= pago.monto.to(pago.reserva.moneda_id, pago.fecha)
        end
      end
    end

    array[moneda_id]
  end

  def operadora_pago
    array = Array.new(4,0)
    pagos.each do |pago|
      if pago.entidad == operadora
        array[pago.monto.moneda_id]+=pago.monto.valor
        #agrego que ponga en la moneda de la reserva el pago transformado a esa moneda.
        if pago.monto.moneda_id != pago.reserva.moneda_id
          array[pago.reserva.monto.moneda_id]+= pago.monto.to(pago.reserva.moneda_id, pago.fecha)
        end
      end
    end
    array[moneda_id]
  end


#### hay que sacar el como = valor y devolver solo el objeto Monto. para eso hay que modificar en los lugares donde
#### aparece agencia_deuda y agencia valor y agregar ".valor"
  def agencia_deuda(como = :valor)
    if como == :valor
      monto.valor - agencia_pago
    else
      m = Monto.new(:valor=>monto.valor,:moneda => monto.moneda)
      m.valor = monto.valor - agencia_pago
      m
    end
  end
  alias :agency_deuda :agencia_deuda

  def operadora_deuda(como = :valor)
    if como == :valor
      monto.valor - operadora_pago
    else
      m = Monto.new(:valor=>monto.valor,:moneda => monto.moneda)
      m.valor = monto.valor - operadora_pago
      m
    end
  end

  def pasajero #array con los roles del usuario
    pasajeros.map do |pasajero|
      pasajero.name
    end
  end

  def pasajero?(pas) #true si el usuario tiene el rol
    pasajero.include?(pas)
  end

  def pasajero_symbols
    pasajeros.map do |pasajero|
      pasajero.name.underscore.to_sym
    end
  end

end

