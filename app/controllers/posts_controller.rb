class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(permitted_post_params)
    @post.category_ids = Category.where(name: params[:post][:category_ids]).pluck(:id)

    if @post.save
      redirect_to @post
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
  end

  def edit
    @post = Post.find(params[:id])

    redirect_to home_path unless @post.author == current_user
  end

  def update
    @post = Post.find(params[:id])
    @post.category_ids = Category.where(name: params[:post][:category_ids]).pluck(:id)

    if @post.update_attributes(permitted_post_params)
      redirect_to @post
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end

  end

  private

  def permitted_post_params
    params.require(:post).permit(:title, :content)
  end
end
