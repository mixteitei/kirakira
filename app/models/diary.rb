class Diary < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  validates :body, length:{in: 1..200}
  attachment :image
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
