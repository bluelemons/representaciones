class TdocsController < InheritedResources::Base
  
  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = Tdoc.search(params[:search])
    else
      @search = Tdoc.baja.search()
    end
      @tdocs = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js 
      format.html
      format.pdf do
        output = TdocReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf", 
                         :type => "application/pdf"
      end
    end
    
  end
  
  def show
    @tdoc = Tdoc.find(params[:id])
    @tdoc.revert_to(params[:version].to_i) if params[:version]
    show! 
  end

  def restore
    @tdoc = Tdoc.find(params[:id])
    @tdoc.revert_to! params[:version_id]
	  redirect_to :action => 'show', :id => @tdoc
  end
  
  def update
    @tdoc = Tdoc.find(params[:id])
    @tdoc.user = current_user
    if @tdoc.update_attributes(params[:tdoc])
      redirect_to :action => 'show', :id => @tdoc, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    @tdoc = Tdoc.new(params[:tdoc])
    @tdoc.user = current_user
    if @tdoc.save
      redirect_to :action => 'show', :id => @tdoc, :format =>'js'
    else
      render 'new.js'
    end
  end 
  
end
