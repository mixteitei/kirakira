class DiariesController < ApplicationController
  def index
    @user =  current_user
    @diaries = Diary.all.order(created_at: :desc)
  end

  def new
    @user = current_user
    @diary = Diary.new
  end

  def create
    diary = Diary.new(diary_params)
    diary.user_id = current_user.id
    if Diary.find_by(user_id: current_user.id, created_at: Time.now.all_day).nil?
      if Point.find_by(user_id: current_user.id, action: 1, created_at: Time.now.all_day).nil?
        point = Point.new
        point.user_id = current_user.id
        point.action = 1
        point.save
        if diary.save
          redirect_to user_path(current_user.id), notice: "投稿完了！ キラキラポイント+1P"
        else
          @user = current_user
          @diary = diary
          render :new
        end
      else
        if diary.save
          redirect_to user_path(current_user.id), notice: "投稿完了！"
        else
          @user = current_user
          @diary = diary
          render :new
        end
      end
    else
      @user =  current_user
      @diary = Diary.new
      flash.now[:alert] = "今日の投稿は完了しています"
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
