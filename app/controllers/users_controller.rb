class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update , :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update , :destroy]

  #Display all users
  def index
    @users = User.all
  end

  # Details of specific User
  def show
  end

  # Add new User
  def new 
    @user = User.new
  end 

  #Save new User
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Crime Portal #{@user.username} You've successfully signed up"
      redirect_to @user
    else
      render 'new'
    end
  end

  # Edit specific User
  def edit
  end

  # Update specific User
  def update
    if @user.update(user_params)
      flash[:notice]= "User is updated successfully"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # Destroy specific User
  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "User details successfully deleted"
    redirect_to root_path
  end

  private

  #private method to pass user parameters to permit the user's information
  def user_params
    params.require(:user).permit(:username , :email, :password)
  end

  # private method to set the user's instance variable
  def set_user
    @user = User.find(params[:id])
  end

  # private method to ensure that the user can only edit or delete their own account
  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own account"
      redirect_to @user
    end
  end

end
