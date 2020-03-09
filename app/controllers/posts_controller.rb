class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :create, :new]
 
  def index
    @posts = Post.all
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @user = @post.user_id
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
      redirect_to post_path(@post, @comment), flash: {success: 'Comment successfully sent !'}
    else
      render template: 'posts/show'
    end
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
    comment = Comment.find(params[:best_comment_id])
    post = comment.post
    if post.update(best_comment_id: params[:best_comment_id])
      redirect_to post_path(post), flash: {success: 'Bestが決まりました'}
    else
      redirect_to post_path(post), flash: {notice: 'もう１度動作を行ってください'}
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:id, :title, :content, :img, :created_at, :user_id, :best_comment_id)
  end

end
