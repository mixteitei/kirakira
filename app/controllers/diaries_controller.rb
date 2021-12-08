class DiariesController < ApplicationController
  def index
  end
  
  def new
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
  end
  
  def update
  end
  
  def destroy
  end
  
  
  private
  
  def diary_params
    params.require(:diary).permit(:body, :image, :user_id)
  end
end
