class SessionsController < ApplicationController
  before_filter :authenticate_user!, only: [:home, :destroy]

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to home_path
    else
      render :new
    end
  end

  def home
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
