class Reserva < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica

  belongs_to :pasajero #es el pasajero titular
  belongs_to :thabitacion
  belongs_to :programa
  belongs_to :monto
  accepts_nested_attributes_for :monto, :reject_if => lambda { |a| a[:valor].blank? }

  belongs_to :operadora, :class_name => "Entidad", :foreign_key => "operadora_id"
  belongs_to :agencia, :class_name => "Entidad",:foreign_key=>'agencia_id'
  has_many :movimientos
  has_and_belongs_to_many :pasajeros

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
  validates :agencia_id, :presence => true
  #scopes

  default_scope select("reservas.*,montos.moneda_id").joins("left join montos on (montos.id = monto_id)")

  scope :baja, where(:hidden=>0)
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

    movimientos.where(:entidad_id=>agencia).pagos.each do |movimiento|
      array[movimiento.monto.moneda_id]+=movimiento.monto.valor
    end

    array[moneda_id]
  end

  def agencia_deuda
    monto.valor - agencia_pago
  end

  def operadora_pago
    array = Array.new(4,0)
    movimientos.where(:entidad_id=>operadora).pagos.each do |movimiento|
      array[movimiento.monto.moneda_id]+=movimiento.monto.valor
    end
    array[moneda_id]
  end

  def operadora_deuda
    monto.valor - operadora_pago
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

