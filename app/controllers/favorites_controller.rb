class FavoritesController < ApplicationController
  def create
    @diary = Diary.find(params[:diary_id])
    @user = User.find(@diary.user_id)
    favorite = current_user.favorites.new(diary_id: @diary.id)
    if Point.find_by(user_id: current_user.id, action: 2, created_at: Time.now.all_day).nil?
      point = Point.new
      point.user_id = current_user.id
      point.action = 2
      point.save
    end
    favorite.save
  end
  
  def destroy
    @diary = Diary.find(params[:diary_id])
    @user = User.find(@diary.user_id)
    favorite = current_user.favorites.find_by(diary_id: @diary.id)
    favorite.destroy
  end
end
