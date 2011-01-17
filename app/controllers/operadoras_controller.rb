class OperadorasController < InheritedResources::Base
  
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
    @operadora.user = current_user
    if @operadora.update_attributes(params[:operadora])
      redirect_to :action => 'show', :id => @operadora, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    @operadora = Operadora.new(params[:operadora])
    @operadora.user = current_user
    if @operadora.save
      redirect_to :action => 'show', :id => @operadora, :format =>'js'
    else
      render 'new.js'
    end
  end 
  
end
