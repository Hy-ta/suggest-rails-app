class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    # @user = current_user.id
  end

  def create
    @comment = Comment.new(comment_params)
    # @comment = current_user.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    @post = Post.find(params[:post_id])
    # @comments = @post.comments
    if @comment.save
      redirect_to post_comment_path(@post, @comment)
    else
      render template: 'posts/show'
    end
  end

  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
    @comments = @post.comments
    # @comment.user_id = User.find(params[:id])
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
