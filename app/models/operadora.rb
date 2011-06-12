class Operadora < Entidad
  #clases

  #asociaciones
  has_many :reservas do
    def deudas
      map do |reserva|
        reserva.send(:operadora_deuda)
      end.delete_if { |m| m.zero? }
    end
  end

  #validaciones

  #scopes

  #metodos

end

