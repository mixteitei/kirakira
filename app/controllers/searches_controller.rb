class SearchesController < ApplicationController
  def search
    @user = current_user
    @range = params[:range]
    @word = params[:word]
    
    if @range == "1"
      @users = User.search(params[:search], @word)
    else
      @diaries = Diary.search(params[:search], @word)
    end
  end
end
