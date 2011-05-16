class CambiosController < InheritedResources::Base
  def index
  end

  def new
    @cambio = Cambio.new
    @search = Reserva.baja.search(:agency_id_eq=>0)
    @reservas = @search.paginate :page => params[:page], :per_page =>10
  end

  def create
    cambio = params[:cambio]
    cambio[:monto] = cambio.delete(:monto).to_money(cambio.delete(:monto_currency))
    @cambio = Cambio.new(cambio)
    @cambio.user = current_user

    if @cambio.save
      flash[:notice] = "Por fin pagaron"
      redirect_to :action => 'new', :format =>'js'
    else
      @search = Reserva.baja.search(:agency_id_eq=>0)
      @reservas = @search.paginate :page => params[:page], :per_page =>10
      render 'new.js'
    end
  end

end

