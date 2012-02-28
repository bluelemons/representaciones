class Provincia < ActiveRecord::Base
  has_many :departamentos
end
