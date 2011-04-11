# -*- coding: utf-8 -*-
class Entidad < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :localidad
  has_many :saldos, :dependent => :destroy  #cuando se borra la entidad se borra el saldo.
  has_many :movimientos

  attr_accessible :type,:name,:cuit,:localidad_id,:calle,:legajo,:telefono,:web,:email
  #validaciones
  #validates :calle, :presence => true
  #validates :cuit, :presence => true
  #validates :telefono, :presence => true
  #validates :legajo, :presence => true
  #validates :email, :presence => true
  #validates :web, :presence => true
  #validates :localidad_id, :presence => true
  validates :name, :presence => true

  #scopes

  scope :baja, where(:hidden=>0)


  #metodos
  #cada vez que se crea la entidad tambien se crea el saldo
  after_create :crear_saldo
  def crear_saldo
    Moneda.all.each do |moneda|
      monto = Monto.create({:valor=>0,:moneda=>moneda})
      Saldo.create({:entidad_id=>id,:monto => monto})
    end
  end

  # Incrementa el saldo de la entidad segun un monto.
  # Si el saldo no existe es creado.

  def deposit(monto)
    # if monto.valor > 0 ## No chequeo porque esto depende de la validación de monto.
    moneda = monto.moneda
    s = get_saldo(moneda.id)
    s.incrementar(monto.valor)
  end

  def get_saldo_by(operadora,moneda_id)
    s=nil
    saldos.each do |sa|
      if sa.monto.moneda_id==moneda_id && saldo.operadora_id == operadora_id
        s = sa
      end
    end
    s
  end

  def get_saldo(m_id,operadora=nil)
    s=nil
    saldos(true).each do |sa|
      if(sa.monto.moneda_id==m_id && operadora_id == nil)
        s = sa
      end
    end
    s
  end

  def saldo_by(operadora, moneda_id)
    saldo = get_saldo_by(operadora, moneda_id)
    if saldo
      saldo.valor
    else
      0
    end
  end

  def deposit_by(operadora, monto)
    saldo = get_saldo_by(operadora, monto.moneda_id)
    if saldo
      m = saldo.monto
      m.valor += monto.valor
      m.save
    else
      Saldo.new(:operadora =>operadora,:entidad_id =>id, :monto =>monto).save
    end
  end

  def withdraw_by(operadora,monto)
    saldo = get_saldo_by(operadora, monto.moneda_id)
    if saldo
      m = saldo.monto
      m.valor -= monto.valor
      m.save
      m.valor
    else
      false
    end
  end

  def withdraw(monto,saldo)
    s = saldo
    m = s.monto
    if s.monto.valor >= monto.valor
      m.valor -= monto.valor
    else
      return false
    end
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
    get_saldo(moneda.id).try(:valor)
  end

end

