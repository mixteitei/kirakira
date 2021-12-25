class SearchesController < ApplicationController
  def search
    @user = current_user
    @range = params[:range]
    @word = params[:word]
    
    if @range == "1"
      @users = User.search(params[:search], @word).page(params[:page]).per(10)
    else
      @diaries = Diary.search(params[:search], @word).page(params[:page]).per(10)
    end
  end
end
