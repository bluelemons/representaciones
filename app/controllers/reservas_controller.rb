class ReservasController < InheritedResources::Base
  #load_and_authorize_resource
  
  respond_to :html, :xml,:js
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
        output = ReservaReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf", 
                         :type => "application/pdf"
      end
    end
    
  end
  
  def new  
    @reserva = Reserva.new
    3.times { @reserva.pasajeros.build }  
    new!
  end  
  
  def show
    @reserva = Reserva.find(params[:id])
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
      redirect_to :action => 'show', :id => @reserva, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    #por cada pasajero que se agrega en el alta de reservas
    i=0
    for pasajero in params[:reserva][:pasajeros_attributes] 
      pasajero?(pasajero[1][:doc],i)
      i+=1
    end
    @reserva = Reserva.new(params[:reserva])
    @reserva.user = current_user
    if @reserva.save 
      redirect_to :action => 'show', :id => @reserva, :format =>'js'
    else
      render 'new.js'
    end 

  end 

  # FIX this later, should be on the model or something like that :)
  private
  
  def pasajero?(doc,i)
    #busca el pasajero con documento igual a doc
    pasa = Pasajero.where(:doc =>doc).limit(1).all
    if pasa.size > 0 #si el pasajero ya existe,
    #  #agrega el id, p.id al arreglo params[:reservas][:pasajeros_ids]
      if !params[:reserva][:pasajero_ids]
        params[:reserva] = params[:reserva].merge(:pasajero_ids => [])
      end
      
      params[:reserva][:pasajero_ids].push(pasa[0].id)
      # borra el pasajero de pasajeros_attributes para que no haga el alta.
    else#si el pasajero no existe, tiene que crealo
      @pasajero = Pasajero.new(params[:reserva][:pasajeros_attributes][i.to_s])
      @pasajero.save
      #lo agrego el id para que cuando haga el alta tambien guarde la relacion.
      params[:reserva][:pasajero_ids].push(@pasajero.id)
    end
  end
  
end
