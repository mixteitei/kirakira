class HomesController < ApplicationController
  def top
    deleted_user_ids = User.where(is_deleted: true).ids
    @diaries = Diary.where.not(user_id: deleted_user_ids).order(created_at: :desc).page(params[:page]).per(10)
  end
end
