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
  end
  
  def followers
  end
  
  def unsubscribe
  end
  
  def withdraw
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:image, :name, :email)
  end
end
