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
  default_scope order(:name)
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

  def deposit(monto,op=nil)
    # if monto.valor > 0 ## No chequeo porque esto depende de la validación de monto.
    moneda = monto.moneda
    s = saldo(moneda.id,op)
    s.incrementar(monto.valor)
  end

  def saldo(m_id,op=nil)
    s=nil
    saldos(true).each do |sa|
      if(sa.monto.moneda_id==m_id && sa.operadora_id == op.try(:id))
        s = sa
      end
    end
    s
  end

  def deposit_by(operadora, monto)
    saldo = saldo(monto.moneda_id,operadora)
    if saldo
      m = saldo.monto
      m.valor += monto.valor
      m.save
    else
      Saldo.new(:operadora =>operadora,:entidad_id =>id, :monto =>monto).save
    end
  end

  def withdraw(monto,sal)
    s = sal
    m = s.monto
    if s.monto.valor >= monto.valor
      m.valor -= monto.valor
    else
      return false
    end
    m.save
    m.valor
  end

end

