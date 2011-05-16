class PagosController < InheritedResources::Base
  def index
  end

  def new
    @pago = Pago.new
    @search = Reserva.baja.search(:agency_id_eq=>0)
    @reservas = @search.paginate :page => params[:page], :per_page =>10
  end

  def create
    pago = params[:pago]
    pago[:monto] = pago.delete(:monto).to_money(pago.delete(:monto_currency))
    @pago = Pago.new(pago)
    @pago.user = current_user

    if @pago.save
      flash[:notice] = "Por fin pagaron"
      redirect_to :action => 'new', :format =>'js'
    else
      @search = Reserva.baja.search(:agency_id_eq=>0)
      @reservas = @search.paginate :page => params[:page], :per_page =>10
      render 'new.js'
    end
  end

end

