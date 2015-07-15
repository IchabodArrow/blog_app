class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(permitted_user_attrs)

    if @user.register
      redirect_to login_path
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def show
  end

  private

  def permitted_user_attrs
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
