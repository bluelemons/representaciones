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
    if borrar_las_que_no_tienen_depositos
      print "1".green
      $correcto += 1
    elsif borrar_las_que_estan_marcadas_como_duplicadas
      print "2".green
      $correcto += 1
    else
      borrar_la_de_monto_menor
      print "3".green
      $correcto += 1
    end
  rescue RuntimeError
    print "F".red
    $fallos << "[#{ ref }] (#{ reservas.size }) #{ $!.message }".brown
  rescue Money::Bank::UnknownRate
    print "F".red
    $fallos << "[#{ ref }] (#{ reservas.size }) #{ $!.message }".brown
  end

  def debug
    p ref: ref,
      tarifas: reservas.map(&:tarifa),
      totales: reservas.map(&:total),
      version: reservas.map(&:version),
      obs: reservas.map(&:obs),
      depositos: reservas.map(&:depositos),
      created_at: reservas.map(&:created_at),
      updated_at: reservas.map(&:updated_at)
  end

  def borrar_las_que_no_tienen_depositos
    a_borrar = reservas.select { |r| r.depositos.empty? }
    if a_borrar.size == reservas.size - 1
      true
    elsif a_borrar.size == reservas.size
      false
    else
      raise "Duplicadas con depósitos"
    end
  end

  def borrar_las_que_estan_marcadas_como_duplicadas
    a_borrar = reservas.select do |res|
      res.obs =~ DUPLICATE_REGEX
    end
    if a_borrar.size == reservas.size - 1
      true
    elsif a_borrar.size == 0
      false
    else
      raise "Duplicadas con observaciones duplicadas"
    end
  end

  def borrar_la_de_monto_menor
    totales = reservas.uniq(&:total)
    if totales.size == 1
      false
    elsif totales.size == reservas.size
      a_borrar = reservas.sort_by(&:total)[0..-1]
      a_borrar.map(&:obs).reject(&:empty?).each do |o|
        $errores << "[#{ ref }] Se borra el siguiente comentario: #{ o }".red
      end
      true
    else
      raise "totales muy raros"
    end
  end

#     case marcadas_como_duplicadas.size
#     when (reservas.size - 1)
#       print "·".green
#       $correcto += 1
#     when 0
#       print "F".red
#       $fallos << "[#{ ref }] (#{ reservas.size }) no pudimos identificar duplicado. Observaciones: #{ reservas.map(&:obs).join('|') }".brown
#     else
#       print "E".red
#       $errores << "[#{ ref }] (#{ reservas.size }) tiene algun problema raro".red
#     end
#   end

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
