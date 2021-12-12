class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @diaries = Diary.where(user_id: @user.id).order(created_at: :desc)
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
    @user = User.find(params[:id])
    @users = @user.followings
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.followers
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
end
