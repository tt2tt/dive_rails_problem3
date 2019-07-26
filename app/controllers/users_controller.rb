class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def new
    @user = User.new
  end

  def show
  end

  def edit
    if current_user
      if current_user.id == @user.id

      else
        redirect_to user_path(current_user.id)
      end
    else
      redirect_to new_session_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path, notice: "削除しました"
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
