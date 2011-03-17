class Agencia < Entidad
  #clases

  #asociaciones

  #validaciones

  #validates :name, :presence => true
  #scopes
  default_scope where(:tentidad_id=>1)

  #metodos
  before_save :poner_tentidad

  def poner_tentidad
    tentidad_id =1
  end

end

