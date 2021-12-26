class SearchesController < ApplicationController
  def search
    @user = current_user
    @range = params[:range]
    @word = params[:word]
    deleted_user_ids = User.where(is_deleted: true).ids
    
    if @range == "1"
      @users = User.search(params[:search], @word).where(is_deleted: false).page(params[:page]).per(10)
    else
      @diaries = Diary.search(params[:search], @word).where.not(user_id: deleted_user_ids).page(params[:page]).per(10)
    end
  end
end
