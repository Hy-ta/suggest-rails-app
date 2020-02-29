class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :create, :new]
 
  def index
    @posts = Post.all
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    # @post = Comment.post_id.find(params[:post_id])
    # @user = User.find(params[:id])
    @user = User.find(@post.user_id)
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end
  
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user != current_user
      redirect_to post_path(@post)
    end

  end
 
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user != current_user
      redirect_to post_path(@post)
    else
    @post.destroy
      redirect_to posts_path
    end
  end

  def best_update
    params[:best_comment_id]
    @comment = Comment.find(params[:id])
    # @post = @comment.post
    @best_comment_id = Post.where(best_comment_id: params[:id])
   
    if @post.best_comment_id.update
      redirect_to root_path
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:id, :title, :content, :img, :created_at, :user_id, :best_comment_id)
  end

end
