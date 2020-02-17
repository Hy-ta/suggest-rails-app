class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Your comment was sent !"
      redirect_to post_path(@post)
    else
      flash[:danger] = "Your comment wasn't sent !"
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
    @comment.user_id = User.find(params[:id])
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :content, :created_at)
  end
end
