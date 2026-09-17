class Movimiento < ActiveRecord::Base
  # Callbacks
#  before_destroy :deshacer

  # Asociaciones. En el modelo original nada era requerido salvo las
  # validaciones explícitas; por eso se usan optional: true.
  belongs_to :user, optional: true #es el usuario que lo crea o modifica
  belongs_to :reserva, optional: true
  belongs_to :entidad
  belongs_to :operadora, optional: true
  belongs_to :cuenta, optional: true
  belongs_to :movimiento, optional: true, :dependent => :destroy
  belongs_to :tdeposito, optional: true
  has_many :movimientos

  monetize :monto_cents, as: :monto
  monetize :monto_final_cents, as: :monto_final

  # Validaciones
  validates :fecha, :presence => true
  validates :entidad, :presence => true
  validates :monto_cents, :presence => true
  validates :monto_currency, :presence => true
  validates_length_of :observaciones, maximum: 250

  # Los movimientos no pueden ser actualizados
  #def readonly?
  #  persisted?
  #end

  # scopes
#  default_scope :include => [:reserva, :cuenta], :order => "id desc"
  scope :baja, -> { where(hidden: 0) }

  # metodos

  def format_monto
    if monto == monto_final
      monto_final.format
    else
      "#{monto.format} -> #{monto_final.format}"
    end
  end

  def self.total(movs)
    movs = movs.group_by { |m| m.monto.currency.iso_code }
    totales = {}
    movs.each do |moneda, mvs|
      total = mvs.map(&:monto).reduce(:+)
      totales[moneda] = total
    end
    totales
  end
end