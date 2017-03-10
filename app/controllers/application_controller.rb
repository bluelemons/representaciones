class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'  
  config.relative_url_root = ""
    
  rescue_from CanCan::AccessDenied do |exception|  
    flash[:error] = "Acceso no permitido!"  
    redirect_to root_url  
  end  
end

