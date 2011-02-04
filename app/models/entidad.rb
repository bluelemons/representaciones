class Entidad < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :localidad
  belongs_to :tentidad  
  has_many :saldos
  has_many :pagos
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
  
  #deposita en el saldo de la entidad una cantidad amount en la moneda moneda_id
  def deposit(monto)
    if monto.valor >0 
      s = saldos.where(:moneda_id=>monto.moneda_id).limit(1)[0]
      s.monto.valor += monto.valor
      s.save
    end
    
    monto.valor
  end
  
  #retira dinero de la cuenta
  def withdraw(monto)
    s = saldos.where(:moneda_id=>monto.moneda_id).limit(1)[0]
    s.monto.valor -= monto.valor
    s.save
    s.monto.valor
  end
end
