class ReservasController < ApplicationController
  def index
    @pagy, @reservas = pagy(Reserva.baja.order(:id))
  end

  def show
    @reserva = Reserva.find(params[:id])
  end
end