class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :create, :new]

  def index
    @users = User.order("id DESC")
    @users = User.paginate(page: params[:page])
    @user = User.new
  end

  def show
    @user = User.find(params[:id])  
    # @currentUserEntry = Entry.where(user_id: current_user.id)
    # @userEntry = Entry.where(user_id: @user.id)
    #  if @user.id == current_user.id
    #   else
    #     @currentUserEntry.each do |cu|
    #       @userEntry.each do |u|
    #         if cu.room_id == u.room_id then
    #           @isRoom = true
    #           @roomId = cu.room_id
    #         end
    #     end
    #   end
    #  end
      
    #   if @isRoom
    #     else
    #       @room = Room.new
    #       @entry = Entry.new
    #   end
  end

  def new
    @user = User.new
  end

  def create
    flash[:notice] = "Only authenticate user" unless user_signed_in?
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end
  
  def edit
    if current_user != @user
      redirect_to user_path(@user), notice: 'You have no permission'
      @user = User.find(params[:id])
    end
  end

  def update
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def chat
    @user = current_user
  end

  def gallery
   
    # @comment = Post.comment.find(params[:best_comment_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :img, :email, :password, :password_confirmation, :char_id)
  end
  
end
