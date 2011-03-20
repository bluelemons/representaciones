class OperadorasController < InheritedResources::Base

  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = Operadora.search(params[:search])
    else
      @search = Operadora.baja.search()
    end
      @entidads = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js{render "entidads/index"}
      format.html
      format.pdf do
        output = OperadoraReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf",
                         :type => "application/pdf"
      end
    end

  end

  def show
    @entidad = Operadora.find(params[:id])
    @entidad.revert_to(params[:version].to_i) if params[:version]
    render "entidads/show"
  end

  def restore
    @operadora = Operadora.find(params[:id])
    @operadora.revert_to! params[:version_id]
	  redirect_to :action => 'show', :id => @operadora
  end

  def update
    @operadora = Operadora.find(params[:id])
    @operadora.user = current_user
    if @operadora.update_attributes(params[:agencia])
      redirect_to :action => 'show', :id => @operadora, :format =>'js'
    else
      render 'entidads/edit.js'
    end
  end

  def new
    @entidad = Operadora.new
    render "entidads/new.js"
  end

  def create
    @operadora = Operadora.new(params[:operadora])
    @operadora.user = current_user
    if @Operadora.save

      if params[:another_one]
        redirect_to :action => 'entidads/new', :format =>'js'
      else
        redirect_to :action => 'entidads/show', :id => @operadora, :format =>'js'
      end
    else
      render 'entidads/new.js'
    end
  end

end

