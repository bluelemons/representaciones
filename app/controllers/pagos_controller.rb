class PagosController < InheritedResources::Base
  def index
  end

  def new
    @pago = Pago.new
    @pago.build_monto
    @search = Reserva.baja.search(:agency_id_eq=>0)
    @reservas = @search.paginate :page => params[:page], :per_page =>10
  end

  def create
    @pago = Pago.new(params[:pago])
    @pago.user = current_user

    if @pago.save
      flash[:notice] = "Por fin pagaron"
      redirect_to :action => 'new', :format =>'js'
    else
      @pago.build_monto
      @search = Reserva.baja.search(:agency_id_eq=>0)
      @reservas = @search.paginate :page => params[:page], :per_page =>10
      render 'new.js'
    end
  end

end

