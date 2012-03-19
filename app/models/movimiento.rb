class Movimiento < ActiveRecord::Base
  # Callbacks
#  before_destroy :deshacer

  # Asociaciones
  belongs_to :reserva
  belongs_to :entidad
  belongs_to :operadora
  belongs_to :movimiento,:dependent => :destroy
  belongs_to :tdeposito
  has_many :movimientos
  monetize   :monto

  # Validaciones
  validates :fecha, :presence => true
  validates :entidad, :presence => true
  validates :monto_cents, :presence => true
  validates :monto_currency, :presence => true
  validate  :monto_positivo

  # Los movimientos no pueden ser actualizados
  #def readonly?
  #  persisted?
  #end

  # scopes
#  default_scope :include => [:reserva, :cuenta], :order => "id desc"

  # metodos
  def self.total(movs)
    movs = movs.group_by { |m| m.monto.currency_as_string }
    totales = {}
    movs = movs.each do |moneda, mvs|
      mvs = mvs.map { |a| a.monto }
      total = mvs.reduce(:+)
      totales[moneda] = total
    end
    totales
  end

  private

  def monto_positivo
    errors.add(:monto, "debe ser positivo") if monto.cents <= 0
  end
end

