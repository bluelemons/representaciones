class OperadorasController < InheritedResources::Base
  load_and_authorize_resource
  
  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = Operadora.search(params[:search])
    else
      @search = Operadora.baja.search()
    end
      @operadoras = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js 
      format.html
      format.pdf do
        output = OperadoraReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf", 
                         :type => "application/pdf"
      end
    end
    
  end
  
  def new
    @direccion = Direccion.new
    new!
  end  
  
  def edit
    @direccion = @operadora.direccion
    edit!
  end
  
  def show
    @operadora = Operadora.find(params[:id])
    @operadora.revert_to(params[:version].to_i) if params[:version]
    show! 
  end

  def restore
    @operadora = Operadora.find(params[:id])
    @operadora.revert_to! params[:version_id]
	  redirect_to :action => 'show', :id => @operadora
  end
  
  def update
    @operadora = Operadora.find(params[:id])
    @direccion = @operadora.direccion
    @operadora.user = current_user
    @direccion.user = current_user
    if @operadora.update_attributes(params[:operadora])
      @direccion.update_attributes(params[:direccion])    
      redirect_to :action => 'show', :id => @operadora, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    @operadora = Operadora.new(params[:operadora])
    @direccion = Direccion.new(params[:direccion])
    @operadora.user = current_user
    @direccion.user = current_user
    if @direccion.save
      @operadora.direccion = @direccion
      if @operadora.save
        redirect_to :action => 'show', :id => @operadora, :format =>'js'
      else
        render 'new.js'
      end
    else
      render 'new.js'
    end
  end 
  
end
