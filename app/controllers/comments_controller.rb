class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    @comment.user = User.find(current_user.id)
    if @comment.save
      flash[:success] = "Your comment was sent !"
      redirect_to post_path(@post)
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
    # @comment.user_id = User.find(params[:img])
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :content, :created_at)
  end
end
