class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :create, :new]
 
  def index
    @posts = Post.all
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
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
      render posts_path
    end
  end


  private
  def post_params
    params.require(:post).permit(:id, :title, :content, :img, :created_at, :user_id)
  end

end
