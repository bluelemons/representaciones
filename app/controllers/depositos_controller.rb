class DepositosController < InheritedResources::Base
  load_and_authorize_resource

  def index
    @search = Deposito.baja.search(params[:search])
    @depositos = @search.paginate(:page=>params[:page], :per_page=>10)
    @depositos = @depositos.includes :entidad, :reserva => :pasajeros

    @reservas_search = Reserva.baja.search()
    @reservas = @reservas_search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js
      format.html
      format.pdf do
        @total = Movimiento.total(@search)
        output = MovimientoReport.new.to_pdf(@search,@total)
        send_data output, :filename => "index_report.pdf",
                          :type     => "application/pdf"
      end
    end
  end

  def new
    @deposito = Deposito.new
  end

  def create
    @deposito = Deposito.new(params[:deposito])
    @deposito.user = current_user
    if @deposito.save
      operadora_paid if params[:operadora_paid]
      flash[:notice] = "El deposito fue registrado correctamente"
      redirect_to :action => 'new', :format =>'js'
    else
      render 'new.js'
    end
  end

  def destroy
    @movimiento = Movimiento.find(params[:id])
    if @movimiento.destroy
      flash[:notice] = "El movimiento ha sido eliminado"
      redirect_to :action => 'index', :format =>'js'
    else
      flash[:notice] = "Este movimiento no puede ser eliminado."
      redirect_to :action => 'index', :format =>'js'
    end
  end

  def operadora_paid
    @odeposito = @deposito.clone
    if @deposito.entidad == @deposito.reserva.agency
      @odeposito.entidad = @deposito.reserva.operadora
    else
      @odeposito.entidad = @deposito.reserva.agency
    end
    @odeposito.save
  end
end
