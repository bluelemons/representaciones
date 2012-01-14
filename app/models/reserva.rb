class Reserva < ActiveRecord::Base
  # clases
  acts_as_versioned
  # asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :thabitacion
  belongs_to :programa

  belongs_to :operadora
  belongs_to :agency
  has_many :pagos do
    def by_entidad(entidad)
      find_all_by_entidad_id(entidad.id)
    end
  end

  has_many :viajeros
  has_many :pasajeros, :through => :viajeros do
    def names
      map { |p| p.name }
    end
    def as_symbols
      map { |p| p.name.underscore.to_sym }
    end
  end

  def dia_creado
     self.created_at.strftime("%d-%m-%Y")
  end

  monetize :total
#  def total_fields=(fields)
#    self.total = fields[:total].to_money(fields[:total_currency])
#  end

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
  validates :total, :presence => true
  #scopes

  default_scope :include => [:operadora,:agency,:programa,:thabitacion,:pagos,:pasajeros],
                :order => "id desc"

  scope :baja, where(:hidden=>0)

  scope :por_vencer, lambda {|fecha| where("fecha = ? and pago_minimo > 0",fecha) }
  search_methods :sin_voucher
  scope :sin_voucher, where("voucher is null")
  #metodos

  def deuda(entidad)
    if entidad == agency
      agencia_deuda
    elsif operadora == entidad
      operadora_deuda
    else
      raise "Se ha pedido la deuda de #{entidad} en la reserva: #{self}, pero esta entidad no tiene nada que ver"
    end
  end

  def actualizar_liquidadas
    self.liquido_agencia = agencia_deuda.zero?
    self.liquido_operadora = operadora_deuda.zero?
    self.save
  end

  def titular
    pasajeros.first.try(:name)
  end

  def moneda
    total.currency.symbol
  end

  def sin_tarifa?
    total.cents <= 0
  end

  def liquidada?
    !self.sin_tarifa? and self.liquido_agencia and self.liquido_operadora
  end

  def agencia_pago
    pagos.by_entidad(agency).map {|p| p.monto.to_money }.reduce(:+) || Money.empty(total.currency)
  end

  def operadora_pago
    pagos.by_entidad(operadora).map {|p| p.monto.to_money }.reduce(:+) || Money.empty(total.currency)
  end

  def agencia_deuda
    total - agencia_pago
  end
  alias :agency_deuda :agencia_deuda

  def operadora_deuda
    total - operadora_pago
  end

  def operadora_deuda_format
    operadora_deuda.format
  end

  def agencia_deuda_format
    agencia_deuda.format
  end

  def pasajero
    warn "`pasajero` is deprecated. Use `pasajeros.names` instead."
    pasajeros.names
  end

  def pasajero?(pas) #true si el usuario tiene el rol
    warn "`pasajero?(pas)` is deprecated. Use `pasajeros.exists?(pas)` instead."
    pasajeros.exists?(pas)
  end

  def pasajero_symbols
    warn "`pasajero_symbols` is deprecated. Use `pasajeros.as_symbols` instead."
    pasajeros.as_symbols
  end

  def destroy
    self.hidden = true
    self.save
  end

end
