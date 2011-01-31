class TpagosController < InheritedResources::Base
  
  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = Tpago.search(params[:search])
    else
      @search = Tpago.baja.search()
    end
      @tpagos = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js 
      format.html
      format.pdf do
        output = TpagoReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf", 
                         :type => "application/pdf"
      end
    end
    
  end
  
  def show
    @tpago = Tpago.find(params[:id])
    @tpago.revert_to(params[:version].to_i) if params[:version]
    show! 
  end

  def restore
    @tpago = Tpago.find(params[:id])
    @tpago.revert_to! params[:version_id]
	  redirect_to :action => 'show', :id => @tpago
  end
  
  def update
    @tpago = Tpago.find(params[:id])
    @tpago.user = current_user
    if @tpago.update_attributes(params[:tpago])
      redirect_to :action => 'show', :id => @tpago, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    @tpago = Tpago.new(params[:tpago])
    @tpago.user = current_user
    if @tpago.save
      redirect_to :action => 'show', :id => @tpago, :format =>'js'
    else
      render 'new.js'
    end
  end 
  
end
