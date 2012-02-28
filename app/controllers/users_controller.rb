class UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @users = User.all
  end
   
  def roles
  end
  
  def update
    if !params[:user]
      roles = []
    else
      roles = params[:user][:role_ids]
    end
    flash[:notice]=params[:id]
    @user.update_attributes({:role_ids =>roles})
    redirect_to roles_path
  end

end