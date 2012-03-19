class Departamento < ActiveRecord::Base
  has_many :localidads
  belongs_to :provincia

  def p
    try(:provincia)
  end

  def pname
    try(:provincia).try(:name)
  end
end
