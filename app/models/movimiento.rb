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
# M2b money: monetize :monto, monetize :monto_final

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

  # M2b money: #format_monto y self.total dependen de monetize.
end