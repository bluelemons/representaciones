class PagosController < InheritedResources::Base
  def index
  end

  def new
    @pago = Pago.new
    @pago.build_monto
  end

  def create
    @pago = Pago.new(params[:pago])
    @pago.user = current_user
    if @pago.save
      flash[:notice] = "Por fin pagaron"
      redirect_to :action => 'new', :format =>'js'
    else
      render 'new.js'
    end
  end

end

