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
    if signed_in?
      @comment.user_id = current_user.id
    else
      @comment.user_id = nil
    end
      @post = Post.find(params[:post_id])
      @comment.post_id = @post.id

    if @comment.save
      redirect_to post_path(@post)
    else
      render template: 'posts/show'
    end
  end

  def show
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comments = @post.comments
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def best_id_comment
    @user = User.find(params[:id])
    @comment.best_id = Comment.find(params[:best_id])
  end
  
  private
  def comment_params
    params.require(:comment).permit(:title, :content, :created_at, :post_id, :user_id, :best_comment_id)
  end
end
