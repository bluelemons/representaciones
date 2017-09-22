class PasesController < ApplicationController
  def new
    @pase = Pase.new source: Reserva.find(params[:reserva])
  end

  def create
    origen = Reserva.find(params[:pase][:origen_id])
    destino = Reserva.find(params[:pase][:destino_id])
    pase_params = params[:pase]
    @pase = Pase.new origen
    Movimiento.transaction do
      tipo = Tdeposito.where(name: 'Pase').first
      #saco la plata de la reserva origen
      agencia = origen.agencia
      operadora = origen.operadora
      monto = Money.new pase_params[:monto].to_d * 100, origen.total.currency
      if ["agencia", "ambas"].include? pase_params[:cuentas_afectadas]
        Deposito.create! fecha: Date.today, entidad: agencia, reserva: origen, monto: monto * -1,
          monto_final: monto * -1,
          tdeposito: tipo, numero: 12,
          observaciones: "Pase a #{ destino } de #{ monto }"
        Deposito.create! fecha: Date.today, entidad: agencia, reserva: destino, monto: monto,
          monto_final: monto,
          tdeposito: tipo, numero: 12,
          observaciones: "Pase desde #{ origen } de #{ monto }"
      end
      if ["operadora", "ambas"].include? pase_params[:cuentas_afectadas]
        Deposito.create! fecha: Date.today, entidad: operadora, reserva: origen, monto: monto * -1,
          monto_final: monto * -1,
          tdeposito: tipo, numero: 12,
          observaciones: "Pase a #{ destino } de #{ monto }"
        Deposito.create! fecha: Date.today, entidad: operadora, reserva: destino, monto: monto,
          monto_final: monto,
          tdeposito: tipo, numero: 12,
          observaciones: "Pase desde #{ origen } de #{ monto }"
      end
    end
  end
end
