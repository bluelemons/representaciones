class TdepositosController < InheritedResources::Base

  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = Tdeposito.search(params[:search])
    else
      @search = Tdeposito.baja.search()
    end
      @tdepositos = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js
      format.html
      format.pdf do
        output = TdepositoReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf",
                         :type => "application/pdf"
      end
    end

  end

  def show
    @tdeposito = Tdeposito.find(params[:id])
    @tdeposito.revert_to(params[:version].to_i) if params[:version]
    show!
  end

  def update
    @tdeposito = Tdeposito.find(params[:id])
    if @tdeposito.update_attributes(params[:tdeposito])
      redirect_to :action => 'show', :id => @tdeposito, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    @tdeposito = Tdeposito.new(params[:tdeposito])
    if @tdeposito.save
      redirect_to :action => 'show', :id => @tdeposito, :format =>'js'
    else
      render 'new.js'
    end
  end

end
