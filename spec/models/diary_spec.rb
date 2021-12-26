# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Diary, "モデルに関するテスト", type: :model do
  before do
    @user = FactoryBot.create(:user)
    @diary = FactoryBot.build(:diary, user_id: @user.id)
  end
  describe '実際に保存してみる' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(@diary).to be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      diary = Diary.new(body:'')
      expect(diary).to be_invalid
      expect(diary.errors[:body][0]).to include("1文字以上")
    end
  end
end