class PagosController < InheritedResources::Base
  load_and_authorize_resource

  def index
  end

  def new
    @pago = Pago.new
    @search = Reserva.baja.search(:agency_id_eq=>0)
    @reservas = @search.paginate :page => params[:page], :per_page =>10
  end

  def update
    @movimiento = Pago.find(params[:id])
    @movimiento.user = current_user
    if @movimiento.update_attributes(params[:pago])
      flash[:notice] = "El pago a sido actualizado"
      render 'movimientos/edit.js'
    else
      flash[:notice] = "El pago no se ha podido actualizar, intente nuevamente"
      render 'movimientos/edit.js'
    end
  end

  def create
    @pago = Pago.new(params[:pago])
    @pago.user = current_user
    if @pago.save
      flash[:notice] = "El pago a sido registrado"
      redirect_to :action => 'new', :format =>'js'
    else
      @search = Reserva.baja.search(:agency_id_eq=>0)
      @reservas = @search.paginate :page => params[:page], :per_page =>10
      render 'new.js'
    end
  end
end

