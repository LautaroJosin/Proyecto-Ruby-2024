class UsersController < ApplicationController
  def index
    # @users = User.where.not(id: current_user.id)
    @users = User.all
    @current_user = current_user
  end

  def edit
    @user = User.find(params[:id])
    @current_user=current_user
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to users_path, notice: "User updated"
    else
      flash[:alert] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  def deactivate
    @user = User.find(params[:id])
    @user.deactivate!
    redirect_to users_path, notice: "User deactivated"
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :phone, :password, :password_confirmation, :role_int, :is_active)
  end
end
