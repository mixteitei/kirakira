class DiariesController < ApplicationController
  before_action :baria_diary, only: [:edit, :update, :destroy]


  def index
    @user =  current_user
    deleted_user_ids = User.where(is_deleted: true).ids
    @diaries = Diary.where.not(user_id: deleted_user_ids).order(created_at: :desc).page(params[:page]).per(10)
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
          if current_user.points.all.sum(:point) + current_user.totalpoint.point == 3 || current_user.points.all.sum(:point) + current_user.totalpoint.point == 21
            flash[:success] = "投稿完了！ ランクアップ！"
          else
            flash[:success] = "投稿完了！ キラキラポイント+1P"
          end
          redirect_to user_path(current_user.id)
        else
          @user = current_user
          @diary = diary
          render :new
        end
      else
        if diary.save
          flash[:success] = "投稿完了！"
          redirect_to user_path(current_user.id)
        else
          @user = current_user
          @diary = diary
          render :new
        end
      end
    else
      @user =  current_user
      @diary = Diary.new
      flash.now[:danger] = "今日の投稿は完了しています"
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

  def baria_diary
    unless Diary.find(params[:id]).user_id == current_user.id
      redirect_to user_path(current_user)
    end
  end
end