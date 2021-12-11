class DiariesController < ApplicationController
  def index
    @user =  current_user
    @diaries = Diary.all
  end
  
  def new
    @user = current_user
    @diary = Diary.new
  end
  
  def create
    diary = Diary.new(diary_params)
    diary.user_id = current_user.id
    if diary.save
      redirect_to user_path(current_user.id)
    else
      @diary = diary
      render :new
    end
  end
  
  def edit
    @user = current_user
    @diary = Diary.find(params[:id])
  end
  
  def update
    diary = Diary.find(params[:id])
    if diary.update(diary_params)
      redirect_to user_path(current_user)
    else
      @user = current_user
      @diary = Diary.find(params[:id])
      render :edit
    end
  end
  
  def destroy
    diary = Diary.find(params[:id])
    diary.destroy
    redirect_to user_path(current_user)
  end
  
  
  private
  
  def diary_params
    params.require(:diary).permit(:body, :image, :user_id)
  end
end
