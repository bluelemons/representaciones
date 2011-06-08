class PagosController < InheritedResources::Base
  load_and_authorize_resource

  def index
  end

  def new
    @pago = Pago.new
    @search = Reserva.baja.search(:agency_id_eq=>0)
    @reservas = @search.paginate :page => params[:page], :per_page =>10
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

