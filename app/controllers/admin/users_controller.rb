class Admin::UsersController < ApplicationController
  before_filter :find_user, :except => [:new, :create, :index]
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
    @address = Address.new
  end
  
  def create
    user_param = params[:user].reject {|key| key == "address"}
    @user = User.new(user_param)
    p @user.errors
    if @user.save
      flash[:notice] = "User is successfully created"
      redirect_to admin_users_path
    else
      render :new
    end
    
  end
  
  def edit
    
  end
  
  def update
    user_param = params[:user].reject {|key| key == "address"}
    
    if @user.update_attributes(user_param)
      flash[:notice] = "User is successfully Updated"
      redirect_to admin_users_path
    else
      render :edit
    end
  end
  
  def show
    
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
