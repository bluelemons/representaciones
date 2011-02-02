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
  def deposit(amount,moneda_id)
    if amount >0 
      s = saldos.where(:moneda_id=>moneda_id).limit(1)[0]
      s.monto+=amount
      s.save
    end
    
    amount
  end
  
  #retira dinero de la cuenta
  def withdraw(amount,moneda_id)
    s = saldos.where(:moneda_id=>moneda_id).limit(1)[0]

    if s.monto > amount #se fija que halla el suficiente dinero
      amount = s.monto
      s.monto=0
      s.save
    end
    
    amount
  end
  
end
