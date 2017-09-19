IDS_A_BORRAR = %w( 33576 32145 33202 33455 33942 34918 35348 35422
35435 35546 35573 35786 35797 36024 36216 36458 36428 36259 36678
36787 36664 29826 32533 18000 15202 4877 11873 20162 25545 27468)

def borrar relation
  p relation.to_a
  relation.delete_all
end

borrar Movimiento.where reserva_id: IDS_A_BORRAR
borrar Reserva::Version.where reserva_id: IDS_A_BORRAR
borrar Viajero.where reserva_id: IDS_A_BORRAR
borrar Reserva.where id: IDS_A_BORRAR
