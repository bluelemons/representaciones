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

ref_duplicadas = Reserva.unscoped
  .group(:referencia)
  .having('count(*) > 1')
  .select('referencia')
  .map(&:referencia)

$correcto = 0
$fallos = []
$errores = []

# Empiezo reemplazando las referencia = id por referencia = id:#{ id }
Reserva.where(referencia: ref_duplicadas)
       .where('referencia = id')
       .update_all('referencia = concat("id:", id)')

class Duplicados

  DUPLICATE_REGEX = /repetid|repite|duplica|EN OTRO ID|EN ESTE ID|ESTA EN ID/i

  attr_reader :ref

  def initialize ref
    @ref = ref
  end

  def self.process ref
    new(ref).process
  end

  def process
    if reservas.size == 1
      # ya está corregida
      print "·".green
    elsif borrar_las_que_no_tienen_depositos
    elsif borrar_las_que_estan_marcadas_como_duplicadas
    elsif borrar_si_son_viejas
    else
      print "F".red
      $fallos << "[#{ ref }] (#{ reservas.size }) no se cual borrar".brown
    end
  rescue RuntimeError
    print "E".red
    $errores << "[#{ ref }] (#{ reservas.size }) #{ $!.message }".brown
  rescue Money::Bank::UnknownRate
    print "E".red
    $errores << "[#{ ref }] (#{ reservas.size }) #{ $!.message }".brown
  end

  def debug
    p ref: ref,
      tarifas: reservas.map(&:tarifa),
      totales: reservas.map(&:total),
      version: reservas.map(&:version),
      salida: reservas.map(&:salida),
      pasajeros: reservas.map(&:pasajeros),
      obs: reservas.map(&:obs),
      depositos: reservas.map(&:depositos),
      created_at: reservas.map(&:created_at),
      updated_at: reservas.map(&:updated_at)
  end

  def borrar reservas
    reservas.each do |r|
      r.delete
      print "·".green
    end
    $correcto += 1
  end

  def borrar_las_que_no_tienen_depositos
    a_borrar = reservas.select { |r| r.depositos.empty? }
    if a_borrar.size == reservas.size - 1
      borrar a_borrar
    elsif a_borrar.size == reservas.size
      false
    else
      raise "Duplicadas con depósitos"
    end
  end

  def borrar_las_que_estan_marcadas_como_duplicadas
    a_borrar = reservas.select do |res|
      res.obs =~ DUPLICATE_REGEX ||
        res.hotel =~ DUPLICATE_REGEX
    end
    if a_borrar.size == reservas.size - 1
      borrar a_borrar
    else
      false
    end
  end

  def borrar_si_son_viejas
    if reservas.all? { |r|
      r.updated_at < Date.new(2017,3,1) && r.salida < Date.new(2017,5,1) }
      warn "[#{ ref }] quedo una reserva sin pax" if reservas.last.pasajeros.empty?
      borrar reservas[0..-2]
    else
      false
    end
  end

  def reservas
    @reservas ||= Reserva.where(referencia: ref)
                         .includes(:depositos)
                         .reorder(:created_at)
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

# [28092] (id: 22635) obs: CAMBIO  CANTIDAD DE PAX  RESERVA  MISMA  REF
# [673357] (id: 19451) obs: RG: 626
# [19197396979899] (id: 19362) obs: srep neto usd 51
# [1950729] (id: 14730) obs: LIQUI C/RG USD 684.60
