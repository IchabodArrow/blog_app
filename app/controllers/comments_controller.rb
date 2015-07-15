class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    comment = @post.comments.new(permitted_comments_attributes)

    comment.commenter = current_user

    unless comment.save
      flash[:errors] = comment.errors.full_messages
    end

    redirect_to @post
  end

  def permitted_comments_attributes
    params.require(:comment).permit(:message)
  end
end
