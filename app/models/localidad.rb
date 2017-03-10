class Localidad < ActiveRecord::Base
  belongs_to :departamento

  #scope :dpto, joins('left join departamentos on (localidads.departamento_id = departamentos.id)') &
  # select('localidads.*, departamentos.name as dpto')
  default_scope :include => :departamento

  delegate :name, :provincia, to: :departamento, prefix: true
  delegate :name, to: :departamento_provincia, prefix: true

  alias_method :d, :departamento
  alias_method :dname, :departamento_name
  alias_method :p, :departamento_provincia
  alias_method :pname, :departamento_provincia_name

  def lname
    name
  end
end

