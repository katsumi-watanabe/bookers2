class UsersController < ApplicationController

  def show

  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to root_path
  end

  def index
    @user = User.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
