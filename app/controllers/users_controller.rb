class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      content_not_found
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "User saved correctly"
    else
        p @user.errors.full_messages
        flash.now[:alert] = @user.errors.full_messages
        render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update(user_params)
        redirect_to users_path, notice: "User updated correctly"
    else
        flash.now[:alert] = "An error has ocurred when updating the user"
        render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User deleted correctly", status: :see_other
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :phone, :join_date, :password, :password_confirmation, :role_id)
    end
end
