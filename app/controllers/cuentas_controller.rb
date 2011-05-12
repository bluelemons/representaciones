class CuentasController < InheritedResources::Base
  respond_to :html, :xml, :js, :json
  def index
    @cuentas = Cuenta.search(params[:search]).where(:entidad_id=>params[:entidad_id]).where("operadora_id = ? or operadora_id is NULL",params[:operadora_id])
    index!
  end
end

