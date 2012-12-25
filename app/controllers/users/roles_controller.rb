class Users::RolesController < ApplicationController
  layout "store"

  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @roles }
    end
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    @role = Role.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @role }
    end
  end

  # GET /roles/new
  # GET /roles/new.json
  def new
    @role = Role.new
    @store_modules = StoreModule.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @role }
    end
  end

  # GET /roles/1/edit
  def edit
    @role = Role.find(params[:id])
    @store_modules = StoreModule.all
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(params[:role])    
    respond_to do |format|
      if @role.valid? && params[:module_permission] && params[:module_permission][:module_permission_id]
        @role.save && StoreModule.create_role_store_module(params[:module_permission][:module_permission_id],@role.id)
        format.html { redirect_to @role, notice: 'Role was successfully created.' }
        format.json { render json: @role, status: :created, location: @role }
      else
        @store_modules = StoreModule.all
        flash[:alert]= @role.valid? ? "Select atleast one module to access" : ""
        format.html { render action: "new" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /roles/1
  # PUT /roles/1.json
  def update
    @role = Role.find(params[:id])
    RoleStoreModule.delete_all(:role_id=>params[:id])
    
    respond_to do |format|
      if (@role.valid? && params[:module_permission] && params[:module_permission][:module_permission_id])
        @role.update_attributes(params[:role]) && StoreModule.create_role_store_module(params[:module_permission][:module_permission_id],@role.id)
        format.html { redirect_to @role, notice: 'Role was successfully updated.' }
        format.json { head :no_content }
      else
        @store_modules = StoreModule.all
        flash[:alert]= @role.valid? ? "Select atleast one module to access" : ""
        format.html { render action: "edit" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to roles_url }
      format.json { head :no_content }
    end
  end
end
