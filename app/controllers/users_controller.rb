class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Happy Quoting #{@user.name}!"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your account is updated succesfully!"
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end