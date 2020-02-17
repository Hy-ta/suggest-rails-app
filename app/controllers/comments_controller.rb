class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      flash[:success] = "Your comment was sent !"
      redirect_to post_path(@post)
    else
      render template: 'posts/show'
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @comments = @post.comments
    @comment.user_id = User.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :content, :created_at, :post_id, :user_id)
  end
end
