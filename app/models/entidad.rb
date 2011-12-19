# -*- coding: utf-8 -*-
class Entidad < ActiveRecord::Base
  # clases
  acts_as_versioned

  # asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :localidad
  has_many :cuentas, :dependent => :destroy  #cuando se borra la entidad se borra la cuenta.
  has_many :movimientos
  has_many :pagos

  attr_accessible :type, :name, :cuit, :localidad_id,
                  :calle, :legajo, :telefono, :web, :email

  #validaciones
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

  # Consulta la cuenta de una entidad en la moneda especificada.
  #
  # @param  [#to_currency] moneda de la cuenta buscada.
  # @param  [Integer] operadora_id id de la operadora que dispone del dinero.
  # @return [Cuenta, nil]

  def cuenta(moneda, operadora_id = nil)
    moneda = Money::Currency.new(moneda).to_s
    cuentas.find_by_monto_currency_and_operadora_id(moneda, operadora_id)
  end

  # Incrementa la cuenta de la entidad segun un monto.
  # Si la cuenta no existe es creada.
  #
  # @param  [#to_money] moneda Moneda de la cuenta buscada.
  # @param  [Operadora] operadora_id operadora que dispone del dinero.
  # @return [Bool]

  def deposit(money, operadora = nil)
    money = money.to_money
    moneda = money.currency_as_string
    # permite que el metodo acepte tanto operadora como id.
    unless operadora.nil?
      operadora = operadora.id unless operadora.kind_of? Integer
    end
   s = Cuenta.find_or_initialize_by_entidad_id_and_monto_currency_and_operadora_id( \
      id, moneda, operadora, {:monto_cents => 0})
    s.monto += money
    s.save
  end

  # Sustrae un monto de la cuenta de la entidad.
  # Si el saldo es insuficiente, da un error.
  #
  # @param  [Money, #to_money] monto Cantidad a sustraer.
  # @param  [Integer] operadora_id id de la operadora que dispone del dinero.
  # @return [Bool]
  # @raise  ["saldo insuficiente"]

  def withdraw(monto, operadora_id = nil)
    monto = monto.to_money
    moneda = monto.currency_as_string
    c = cuenta(moneda, operadora_id)
    # TODO fix it nicely.
    if (monto - c.monto).cents < 3
      monto = c.monto
    end
    c && c.monto >= monto && deposit(monto * -1, operadora_id)
  end

  # Consulta las deudas de la entidad en todas las reservas.
  #
  # @return [Hash] deudas de la entidad por moneda

  def deudas
    @deudas_by_currency ||= _deudas_by_currency
    @deudas_by_currency
  end

  # Consulta las deudas de la entidad en cada reserva en una moneda.
  #
  # @return [Money]

  def deuda(currency)
    @deudas_by_currency ||= _deudas_by_currency || 1
    @deudas_by_currency[currency.to_currency]
  end

  private

  def _deudas_by_currency
    deudas_by_currency = {}
    reservas.deudas.group_by { |m| m.currency }.each do |c, d|
      # a cada currency le asigno la suma correspondiente
      deudas_by_currency[c] = d.sum(:+)
    end
    deudas_by_currency
  end
end

