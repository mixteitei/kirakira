class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :diaries, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one :point, dependent: :destroy
  attachment :image

  validates :name, uniqueness:true, length:{minimum:2, maximum:20}
  validates :email, presence: true, uniqueness:true

  def active_for_authentication?
    super && is_deleted == false
  end
  
  after_create do |user|
    point = Point.new
    point.user_id = user.id
    point.save
  end
end
