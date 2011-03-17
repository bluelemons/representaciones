class MonedasController < InheritedResources::Base

  respond_to :html, :xml,:js

  protected
  def begin_of_association_chain
    @current_user
  end

  def index
    if params[:search]
      @search = Moneda.search(params[:search])
    else
      @search = Moneda.baja.search()
    end
      @monedas = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js
      format.html
      format.pdf do
        output = MonedaReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf",
                         :type => "application/pdf"
      end
    end

  end

  def show
    @moneda = Moneda.find(params[:id])
    @moneda.revert_to(params[:version].to_i) if params[:version]
    show!
  end

  def restore
    @moneda = Moneda.find(params[:id])
    @moneda.revert_to! params[:version_id]
	  redirect_to :action => 'show', :id => @moneda
  end

  def update
    @moneda = Moneda.find(params[:id])
    @moneda.user = current_user
    if @moneda.update_attributes(params[:moneda])
      redirect_to :action => 'show', :id => @moneda, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    @moneda = Moneda.new(params[:moneda])
    @moneda.user = current_user
    if @moneda.save
      redirect_to :action => 'show', :id => @moneda, :format =>'js'
    else
      render 'new.js'
    end
  end

end

