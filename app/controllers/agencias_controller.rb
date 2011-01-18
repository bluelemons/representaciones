class AgenciasController < InheritedResources::Base
  
  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = Agencia.search(params[:search])
    else
      @search = Agencia.baja.search()
    end
      @agencias = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js 
      format.html
      format.pdf do
        output = AgenciaReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf", 
                         :type => "application/pdf"
      end
    end
    
  end
  
  def new
    @direccion = Direccion.new
    new!
  end  
  
  def show
    @agencia = Agencia.find(params[:id])
    @agencia.revert_to(params[:version].to_i) if params[:version]
    show! 
  end

  def restore
    @agencia = Agencia.find(params[:id])
    @agencia.revert_to! params[:version_id]
	  redirect_to :action => 'show', :id => @agencia
  end
  
  def update
    @agencia = Agencia.find(params[:id])
    @agencia.user = current_user
    if @agencia.update_attributes(params[:agencia])
      redirect_to :action => 'show', :id => @agencia, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    @agencia = Agencia.new(params[:agencia])
    @direccion = Direccion.new(params[:direccion])
    @agencia.user = current_user
    @direccion.user = current_user
    if @direccion.save
      @agencia.direccion = @direccion
      if @agencia.save
        redirect_to :action => 'show', :id => @agencia, :format =>'js'
      else
        render 'new.js'
      end
    else
      render 'new.js'
    end
  end 
  
end
