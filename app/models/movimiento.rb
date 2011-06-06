class Movimiento < ActiveRecord::Base
  #clases

  # Asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :reserva
  belongs_to :entidad
  belongs_to :operadora
  belongs_to :cuenta
  monetize   :monto

  # Validaciones
  validates :fecha, :presence => true
  validates :entidad, :presence => true
  validates :monto_cents, :presence => true
  validates :monto_currency, :presence => true

  # Los movimientos no pueden ser actualizados
  def before_update
    false
  end
  
  # scopes
  default_scope :include => [:reserva, :cuenta], :order => "id desc"
  scope :baja, where(:hidden=>0)

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
end

