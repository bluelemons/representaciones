class Departamento < ActiveRecord::Base
  has_many :localidads
  belongs_to :provincia

  delegate :name, to: :provincia, prefix: true, allow_nil: true

  alias_method :pname, :provincia_name
  alias_method :p, :provincia
end
