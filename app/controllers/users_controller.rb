class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :owner_user,     only: [:makeAdmin, :removeAdmin]
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def destroy
    user = User.find(params[:id])
    user_name = user.name
    user.destroy
    flash[:success] = "User \"#{user_name}\" deleted."
    redirect_to users_url
  end
  
  def makeAdmin
    user = User.find(params[:id])
    user.update_attribute(:admin, true)
    flash[:success] = "User \"#{user.name}\" is now an admin."
    redirect_to users_url
  end
  
  def removeAdmin
    user = User.find(params[:id])
    user.update_attribute(:admin, false)
    flash[:success] = "User \"#{user.name}\" is now an admin."
    redirect_to users_url
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Juanna.net!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
    def owner_user
      redirect_to(root_url) unless current_user.owner?
    end
end
