# -*- coding: utf-8 -*-
class Entidad < ActiveRecord::Base
  # clases
  acts_as_versioned

  # asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :localidad
  has_many :saldos, :dependent => :destroy  #cuando se borra la entidad se borra el saldo.
  has_many :movimientos

  attr_accessible :type, :name, :cuit, :localidad_id,
                  :calle, :legajo, :telefono, :web, :email

  #validaciones
  validates :name, :presence => true
  #validates :calle, :presence => true
  #validates :cuit, :presence => true
  #validates :telefono, :presence => true
  #validates :legajo, :presence => true
  #validates :email, :presence => true
  #validates :web, :presence => true
  #validates :localidad_id, :presence => true

  #scopes
  default_scope order(:name)

  scope :baja, where(:hidden=>0)

  # metodos

  # Consulta el saldo de una entidad en la moneda especificada.
  #
  # @param  [#to_currency] moneda del saldo buscado.
  # @param  [Integer] operadora_id id de la operadora que dispone del dinero.
  # @return [Saldo, nil]

  def saldo(moneda, operadora_id = nil)
    moneda = Money::Currency.new(moneda).to_s
    saldos.find_by_monto_currency_and_operadora_id(moneda, operadora_id)
  end

  # Incrementa el saldo de la entidad segun un monto.
  # Si el saldo no existe es creado.
  #
  # @param  [#to_money] moneda Moneda del saldo buscado.
  # @param  [Operadora] operadora_id operadora que dispone del dinero.
  # @return [Bool]

  def deposit(money, operadora = nil)
    money = money.to_money
    moneda = money.currency_as_string
    # permite que el metodo acepte tanto operadora como id.
    unless operadora.nil?
      operadora = operadora.id unless operadora.kind_of? Integer
    end
   s = Saldo.find_or_initialize_by_entidad_id_and_monto_currency_and_operadora_id( \
      id, moneda, operadora, {:monto_cents => 0})
    s.monto += money
    s.save
  end

  # Quita el saldo de la entidad segun un monto.
  # Si el saldo no es suficiente, da un error.
  #
  # @param  [Money, #to_money] moneda Moneda del saldo buscado.
  # @param  [Integer] operadora_id id de la operadora que dispone del dinero.
  # @return [Bool]
  # @raise  ["no hay suficiente saldo"]

  def withdraw(monto, operadora_id = nil)
    monto = monto.to_money
    moneda = monto.currency_as_string
    saldo = saldo(moneda, operadora_id)
    if saldo && saldo.monto >= monto
        deposit(monto * -1, operadora_id)
    else
      raise "No hay suficiente saldo"
    end
  end

  def deudas
    d = Array.new(3,0)
    reservas.each do |r|
      d[r.moneda_id-1] += r.send((type.downcase + "_deuda").to_sym) if r.moneda_id
    end
    d
  end
end

