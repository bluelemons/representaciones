class CambiosController < InheritedResources::Base
  load_and_authorize_resource

  def index
  end

  def new
    @cambio = Cambio.new
    @search = Reserva.baja.search(:agency_id_eq=>0)
    @reservas = @search.paginate :page => params[:page], :per_page =>10
  end

  def create
    @cambio = Cambio.new(params[:cambio])
    if @cambio.save
      flash[:notice] = "El cambio de monedas fue realizado correctamente"
      redirect_to :action => 'new', :format =>'js'
    else
      @search = Reserva.baja.search(:agency_id_eq=>0)
      @reservas = @search.paginate :page => params[:page], :per_page =>10
      render 'new.js'
    end
  end
end
