class Diary < ApplicationRecord
  belongs_to :user
  validates :body, length:{in: 1..200}
  attachment :image
end
