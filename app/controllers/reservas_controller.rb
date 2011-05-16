class ReservasController < InheritedResources::Base
  load_and_authorize_resource
  respond_to :html, :xml, :js, :json
  def index
    if params[:search]
      @search = Reserva.search(params[:search])
    else
      @search = Reserva.baja.search()
    end
    @reservas = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js
      format.html
      format.pdf do
        output = ReservaReport.new.regular(@search,params[:search])
        send_data output, :filename => "index_report.pdf",
                         :type => "application/pdf"
      end
    end
  end

  def new
#    @reserva = Reserva.new
#    @reserva.build_monto
    @pasajero = Pasajero.new

    new!
  end

  def edit
    @pasajero = Pasajero.new
    edit!
  end

  def show
    @reserva.revert_to(params[:version].to_i) if params[:version]
    show!
  end

  def restore
    @reserva = Reserva.find(params[:id])
    @reserva.revert_to! params[:version_id]
    redirect_to :action => 'show', :id => @reserva
  end

  def update
    @reserva = Reserva.find(params[:id])
    @reserva.user = current_user
    if @reserva.update_attributes(params[:reserva])

      redirect_to :action => 'show', :id => @reserva, :format =>'js',:controller=>'reservas'
    else
      render 'reservas/edit.js'
    end
  end

  def create
    @reserva = Reserva.new(params[:reserva])
    @reserva.user = current_user
    if @reserva.save
      flash[:notice]="Reserva creada"
      redirect_to :action => 'show', :id => @reserva, :format =>'js'
    else
      @pasajero = Pasajero.new
      render 'new.js'
    end
  end
end

