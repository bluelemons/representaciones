class ProgramasController < InheritedResources::Base

  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = Programa.search(params[:search])
    else
      @search = Programa.search()
    end
      @programas = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js
      format.html
      format.pdf do
        output = ProgramaReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf",
                         :type => "application/pdf"
      end
    end

  end

  def show
    @programa = Programa.find(params[:id])
    @programa.revert_to(params[:version].to_i) if params[:version]
    show!
  end

  def update
    @programa = Programa.find(params[:id])
    if @programa.update_attributes(params[:programa])
      redirect_to :action => 'show', :id => @programa, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    @programa = Programa.new(params[:programa])
    if @programa.save
      redirect_to :action => 'show', :id => @programa, :format =>'js'
    else
      render 'new.js'
    end
  end

end
