class UsersController < ApplicationController
  before_action :baria_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @diaries = Diary.where(user_id: @user.id).order(created_at: :desc).page(params[:page]).per(10)
  end
  
  def edit
    @user = current_user
  end
  
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(current_user)
    else
      @user = current_user
      render :edit
    end
  end
  
  def follows
    @user = current_user
    @users = User.find(params[:id]).followings.all.page(params[:page]).per(10)
  end
  
  def followers
    @user = current_user
    @users = User.find(params[:id]).followers.all.page(params[:page]).per(10)
  end
  
  def unsubscribe
    @user = current_user
  end
  
  def withdraw
    user = current_user
    user.update(is_deleted: true)
    reset_session
    flash[:id_deleted] = "退会処理を実行しました"
    redirect_to root_path
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:image, :name, :email)
  end
  
  def baria_user
    unless User.find(params[:id]).id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
