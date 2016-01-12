class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :collect_user, only: [edit, :update]
  
  def show
    @user = User.find(params[:id])
    return redirect_to :root if @user.nil?
  end
  
  def new
    @user = User.new
  end
  
  def edit
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
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :area, :profile,
                                 :password_confirmation)
  end                               
  def set_user
    @user = User.find(params[:id])
  end
  def collect_user
    if current_user != @user
      redirect_to root_path
    end
  end
end
