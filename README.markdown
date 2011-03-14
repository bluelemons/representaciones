# S. Representaciones

Sistema para la gestión de representaciones de turismo. Permite
administrar reservas realizadas por las agencias en las distintas
operadoras representadas.

## Modelos

1. Reservas: representan un paquete de turismo en particular, vendido
por una *agencia* y comprado a una *operadora*.
 - Contiene un listado de pasajeros y otros *datos referidos al viaje*
 (tipo se servicio, habitaciones, etc.).
 - También dispone de una  *tarifa* que es el monto que debe ser
 pagado por la agencia a la operadora.
 - Indica también dos fechas, una es la *fecha de realización* del
 viaje (en que el mismo debe estar totalmente pago) y la fecha de
 *vencimiento*, que es la fecha en que debe ser pagada la seña.

2. Entidades: Clase que engloba a las agencias y a las operadoras.

  1. Agencia: La agencia de turismo que compra el paquete. Cada una
  dispone de uno o más *saldos* (dinero depositado en S para realizar
  pagos) o *saldos en las operadoras* (dinero enviado directamente a la
  operadora).

  2. Operadora: Las operadoras de turismo que venden los paquetes en
  cuestión. S dispone de uno o más saldos en las mismas, que
  representan el dinero depositado en ellas para la realización de
  pagos.  

3. Movimiento: todo tipo de movimiento de dinero, 

  1. Depósito: Agrega dinero a un saldo. Se acompaña de información
  sobre el medio por el cual fue transferido (banco, efectivo, etc.) y
  de forma que se permita rastrear el comprobante.

  2. Pago: Se que quita dinero de un saldo para pagar una reserva. En
  caso de ser distintas las monedas, se asocian a un valor de cambio.

4. Monto: Todo monto de dinero tiene asociado un valor y una moneda.

## Controladores

- Pagos: Permite registrar pagos realizados por las agencias o a las
  operadoras, indicando la reserva a la que refieren. También permite
  registrar depósitos realizados previos al pago.

- Reservas: Permite dar de alta nuevas reservas y realizar
  modificaciones sobre las mismas. También es posible ver el estado de
  pago de las mismas.

- Entidades: Permite administrar las entidades (tanto agencias como
  operadoras), realizar altas, bajas y modificaciones. También
  permiten conocer toda la información referida a su deuda con S.

## Vistas

La vista principal ofrece un menú superior que da acceso a las
distintas funciones y distintos listados de cuestiones que deben ser
tratadas.

- Reservas cercanas al plazo de vencimiento. (indicando las 10 más
  urgentes).
- Modificaciones: listado de las últimas 10 modificaciones (indicando
  quien realizó cada una) para un rápido conocimiento de la
  situación de los compañeros.
- Mensajes: mensajes recibidos por los compañeros de trabajo.
