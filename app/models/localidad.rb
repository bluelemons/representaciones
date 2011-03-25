class Localidad < ActiveRecord::Base
  belongs_to :departamento

  #scope :dpto, joins('left join departamentos on (localidads.departamento_id = departamentos.id)') &
  # select('localidads.*, departamentos.name as dpto')
  default_scope :include => :departamento
  def pname
    try(:departamento).try(:provincia).try(:name)
  end

  def p
    try(:departamento).try(:provincia)
  end

  def d
    try(:departamento)
  end

  def dname
    try(:departamento).try(:name)
  end

  def lname
    try(:name)
  end

end

