class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_login, except: [ :index, :show, :new, :create]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Happy Quoting #{@user.name}!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit

  end

  def update

    if @user.update(user_params)
      flash[:notice] = "Your account is updated succesfully!"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:notice] = "You can only edit your own profile"
      redirect_to user_path(current_user)
    end
  end
end
