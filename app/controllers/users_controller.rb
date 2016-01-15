class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :logged_in_user, only: [ :following, :followers]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def edit
    redirect_to root_path unless(current_user == @user)
  end
  
  def update
    if @user.update(user_params)
      redirect_to root_path , notice: 'Profile編集しました'
    else
      render 'edit'
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ようこそサンプルアプリケーションへ！"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  
  def followings
    @user = User.find(params[:id])
    @users = @user.following_users
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.follower_users
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :area, :profile,
                                 :password_confirmation)
  end                               
  def set_user
    @user = User.find(params[:id])
  end
end
