class MovmimientosController < InheritedResources::Base
  
  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = Movimiento.search(params[:search])
    else
      @search = Movimiento.baja.search()
    end
      @movimientos = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js 
      format.xml
      format.html
      format.pdf do
        output = MovimientoReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf", 
                         :type => "application/pdf"
      end
    end
    
  end
  
  def show
    if params[:doc]
      @movimiento = Movimiento.where(:doc =>params[:doc]).limit(1)
    else
      @pasajero = Pasajero.find(params[:id])
      @pasajero.revert_to(params[:version].to_i) if params[:version]
      @reservas = @pasajero.reservas.paginate :page => params[:page], :per_page =>10
    end
    show! do |format|
      format.html 
      format.xml { render :xml => @pasajero }
    end
  end

  def restore
    @pasajero = Pasajero.find(params[:id])
    @pasajero.revert_to! params[:version_id]
	  redirect_to :action => 'show', :id => @pasajero
  end
  
  def update
    @pasajero = Pasajero.find(params[:id])
    @pasajero.user = current_user
    if @pasajero.update_attributes(params[:pasajero])
      redirect_to :action => 'show', :id => @pasajero, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    @pasajero = Pasajero.new(params[:pasajero])
    @pasajero.user = current_user
    if @pasajero.save
      #que vuelva para cargar otro pasajero.
      #redirect_to :action => 'show',:controller=>'pasajeros', :id => @pasajero, :format =>'js'
      @ultimo = @pasajero #guardo ultimo en otra variable para que en new.js.erb pueda guardarlo en la tabla.
      @pasajero = Pasajero.new()#asì me pone el formulario en blanco
      render 'pasajeros/new.js'
    else
      render 'pasajeros/new.js'
    end
  end 
  
end
