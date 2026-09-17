class ReservasController < ApplicationController
  def index
    @reservas = Reserva.baja.order(:id)
  end

  def show
    @reserva = Reserva.find(params[:id])
  end
end