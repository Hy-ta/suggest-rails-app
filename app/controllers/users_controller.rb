class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :create, :new]

  def index
    @users = User.paginate(page: params[:page])
    @user = User.new
  end

  def show
    @user = User.find(params[:id])  
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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def library
  end

  private

  def user_params
    params.require(:user).permit(:name, :img, :email, :password, :password_confirmation)
  end

  def after_sign_up_path_for(resource)
    "/user/#{current_user.id}"
  end

  def after_sign_out_path_for(resource)
    users_index_path
  end
  
end