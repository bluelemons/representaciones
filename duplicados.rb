class String
  def black;          "\033[30m#{self}\033[0m" end
  def red;            "\033[31m#{self}\033[0m" end
  def green;          "\033[32m#{self}\033[0m" end
  def brown;          "\033[33m#{self}\033[0m" end
  def blue;           "\033[34m#{self}\033[0m" end
  def magenta;        "\033[35m#{self}\033[0m" end
  def cyan;           "\033[36m#{self}\033[0m" end
  def gray;           "\033[37m#{self}\033[0m" end
end

ref_duplicadas = Reserva
  .group(:referencia)
  .having('count(*) > 1')
  .select('referencia')
  .map(&:referencia)

$correcto = 0
$fallos = []
$errores = []

class Duplicados

  DUPLICATE_REGEX = /cancela|anula(da|ar)|repetid|repite|duplica|EN OTRO ID|EN ESTE ID|ESTA EN ID/i

  attr_reader :ref

  def initialize ref
    @ref = ref
  end

  def self.process ref
    new(ref).process
  end

  def process
    case marcadas_como_duplicadas.size
    when (reservas.size - 1)
      print "·".green
      $correcto += 1
    when 0
      print "F".red
      $fallos << "[#{ ref }] (#{ reservas.size }) no pudimos identificar duplicado. Observaciones: #{ reservas.map(&:obs).join('|') }".brown
    else
      print "E".red
      $errores << "[#{ ref }] (#{ reservas.size }) tiene algun problema raro".red
    end
  end

  def marcadas_como_duplicadas
    @marcadas_como_duplicadas ||=
      begin
        reservas.select do |res|
          if res.obs =~ DUPLICATE_REGEX && !res.depositos.empty?
            # warn "No se borra reserva #{ res.id } con movimientos cargados Obs: #{ res.obs }".red
            print 'W'.magenta
          end

          res.obs =~ DUPLICATE_REGEX && res.depositos.empty?
        end
      end
  end

  def reservas
    @reservas ||= Reserva.where(referencia: ref)
  end
end

ref_duplicadas.each do |ref|
  next if ref == ""
  # salteamos reservas sin referencia
  Duplicados.process ref
end

puts
puts "FALLOS"
puts $fallos
puts
puts "ERRORES"
puts $errores
puts
puts "Procesados #{ ref_duplicadas.size } referencias, #{ $correcto } corregidas, #{ $fallos.size } fallos, #{ $errores.size } errores"
puts
