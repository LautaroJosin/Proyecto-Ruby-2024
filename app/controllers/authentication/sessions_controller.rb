class Authentication::SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "User saved correctly"
    else
        flash.now[:alert] = @user.errors.full_messages
        render :new, status: :unprocessable_entity
    end
  end
end
