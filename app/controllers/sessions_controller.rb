class SessionsController < ApplicationController
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
    current_user = User.where(id: session[:user_id]).first

    redirect_to login_path unless current_user
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
