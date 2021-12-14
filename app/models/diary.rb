class Diary < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  validates :body, length:{in: 1..200}
  attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.search(search, word)
    Diary.where("body LIKE?", "%#{word}%")
  end
end
