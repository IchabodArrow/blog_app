class PostsController < ApplicationController
  def new
    @post = Post.new
    @categories = %w(politics sports entertainment technology health)
  end

  def create
    @post = current_user.posts.new(permitted_post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
  end

  def edit
  end

  private

  def permitted_post_params
    params.require(:post).permit(:title, :content)
  end

  def current_user
    @current_user ||= User.where(id: session[:user_id]).first
  end
end
