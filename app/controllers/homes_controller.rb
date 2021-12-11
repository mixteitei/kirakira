class HomesController < ApplicationController
  def top
    @diaries = Diary.all.order(created_at: :desc)
  end
end
