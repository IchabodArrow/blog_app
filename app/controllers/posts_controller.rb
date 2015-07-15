class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new]
  before_filter :find_post, only: [:show, :edit, :update]
  before_filter :authorized_user!, only: [:edit, :update]

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
  end

  def index
  end

  def edit
  end

  def update
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

  def find_post
    @post = Post.find(params[:id])
  end

  def authorized_user!
    redirect_to @post unless @post.author == current_user
  end
end
