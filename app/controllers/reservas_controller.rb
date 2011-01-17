class ReservasController < InheritedResources::Base
  
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
    @reserva = Reserva.new(params[:reserva])
    @reserva.user = current_user
    if @reserva.save
      redirect_to :action => 'show', :id => @reserva, :format =>'js'
    else
      render 'new.js'
    end
  end 
  
end
