class PagosController < InheritedResources::Base
  load_and_authorize_resource

  belongs_to :reserva, :optional => true

  def update
    @pago = Pago.find(params[:id])
    @pago.user = current_user
    update!
  end

  def create
    @reserva = Reserva.find(params[:reserva_id]) if params[:reserva_id]
    @pago = Pago.new(params[:pago])
    @pago.user = current_user
    create! do
      if @reserva
        redirect_to reserva_url(@reserva)
      else
        redirect_to new_pago_url(@pago)
      end
    end
  end
end
