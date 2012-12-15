class Admin::RoleStoreModulesController < ApplicationController

  def index
    @role_store = RoleStoreModule.all
  end

  def store_role
	@role_store = RoleStoreModule.find_by_store_module_id(params[:store_module_id])
  end
  
  def update   
    #~ if @user.update_attributes(user_param)
      #~ flash[:notice] = "User is successfully Updated"
      #~ redirect_to admin_users_path
    #~ else
      #~ render :edit
    #~ end
  end

end
