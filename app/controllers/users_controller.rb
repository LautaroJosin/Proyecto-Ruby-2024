class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id)
    @current_user = current_user
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
        content_not_found
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize! :edit, @user
  end

  def update
    @user = User.find(params[:id])
    authorize! :update, @user
    if @user.update(user_params)
      redirect_to users_path, notice: "User updated"
    else
      flash.now[:alert] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  def deactivate
    @user = User.find(params[:id])
    @user.deactivate!
    redirect_to users_path, notice: "User deactivated"
  end

  def activate
    @user = User.find(params[:id])
    @user.activate!
    redirect_to users_path, notice: "User activated"
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :phone, :password, :password_confirmation, :role_int, :is_active)
  end
end
