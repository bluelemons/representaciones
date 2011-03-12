class Entidad < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :localidad
  belongs_to :tentidad
  has_many :saldos,:dependent => :destroy  #cuando se borra la entidad se borra el saldo.

  has_many :movimientos
  #validaciones

  #validates :calle, :presence => true
  #validates :cuit, :presence => true
  #validates :telefono, :presence => true
  #validates :legajo, :presence => true
  #validates :email, :presence => true
  #validates :web, :presence => true
  validates :localidad_id, :presence => true
  validates :name, :presence => true
  validates :tentidad_id, :presence => true
  #scopes
  scope :baja, where(:hidden=>0)
  scope :agencia, where(:tentidad_id=>1)
  scope :operadora, where(:tentidad_id=>2)
  #metodos

  after_save :crear_saldo  #cada vez que se crea la entidad tambien se crea el saldo
#
  def crear_saldo
    Moneda.all.each do |moneda|
      monto = Monto.create({:valor=>0,:moneda=>moneda})
      Saldo.create({:entidad_id=>id,:monto => monto})
    end
  end

  #deposita en el saldo de la entidad una cantidad amount en la moneda moneda_id
  def deposit(monto)
    if monto.valor >0
      s = saldos.by_moneda_id(monto.moneda.id).first
      s.valor += monto.valor
      s.save
      s.valor
    end
  end

  def saldo_by(operadora,moneda_id)
    saldo = saldos.by_operadora_id(operadora.id).by_moneda_id(moneda_id).first
    if saldo
      saldo.valor
    else
      0
    end
  end

  def deposit_by(operadora,monto)
    saldo = saldos.by_moneda_id(monto.moneda_id).by_operadora_id(operadora.id).first
    if saldo
      m = saldo.monto
      m.valor += monto.valor
      m.save
    else
      Saldo.new(:operadora =>operadora,:entidad_id =>id, :monto =>monto).save
    end
  end

  def withdraw_by(operadora,monto)
    saldo = saldos.by_operadora_id(operadora.id).by_moneda_id(monto.moneda_id).first
    if saldo
      m = saldo.monto
      m.valor -= monto.valor
      m.save
      m.valor
    else
      false
    end
  end

  def withdraw(monto)
    s = saldos.by_moneda_id(monto.moneda.id).first
    if s.valor > monto.valor
      s.valor -= monto.valor
    else
      return false
    end
    m = s
    m.save
    m.valor
  end

  #def saldo_by_moneda(moneda)
  #  s = nil
  #  saldos.each do |saldo|
  #    if saldo.monto.moneda == moneda
  #      s = saldo
  #    end
  #  end
  #  s
  # saldos.by_moneda(moneda.id).first
  #end

  def saldo(moneda)
  #  s = nil
  #  saldos.each do |saldo|
  #    if saldo.monto.moneda == moneda
  #      s = saldo
  #    end
  #  end
  #  s.monto.valor
    saldos.by_moneda_id(moneda.id).first.try(:valor)
  end

end

