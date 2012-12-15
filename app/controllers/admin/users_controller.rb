class Admin::UsersController < ApplicationController
  before_filter :find_user, :only => [:edit, :update, :show, :destroy]
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
    #@address = Address.new
	@role = Role.all
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User is successfully created"
      redirect_to admin_users_path
    else
      render :new
    end
    
  end
  
  def edit
	@address = @user.address.inspect
	@role = Role.all
  end
  
  def update   
    if @user.update_attributes(user_param)
      flash[:notice] = "User is successfully Updated"
      redirect_to admin_users_path
    else
      render :edit
    end
  end
  
  def show
    p @address = @user.address
  end
  
  def destroy
    @user.destroy
    flash[:notice] = "User is successfully deleted"
    redirect_to admin_users_path
  end
  
  protected
  
  def find_user
    @user = User.find_by_id(params[:id])
    redirect_to admin_users_path if @user.nil?
  end
  
  
end
