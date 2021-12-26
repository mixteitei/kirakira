class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :diaries, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reverse_of_relationships, class_name:"Relationship", foreign_key:"followed_id", dependent: :destroy
  has_many :relationships, class_name:"Relationship", foreign_key:"follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :points, dependent: :destroy
  has_one :totalpoint, dependent: :destroy
  attachment :image

  validates :name, uniqueness:true, length:{minimum:2, maximum:20}
  validates :email, presence: true, uniqueness:true

  def active_for_authentication?
    super && is_deleted == false
  end
  
  after_create do |user|
    point = Point.new
    point.user_id = user.id
    point.action = 0
    point.save
    totalpoint = Totalpoint.new
    totalpoint.user_id = user.id
    totalpoint.save
  end
  
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
  
  def self.search(search, word)
    User.where("name LIKE?", "%#{word}%")
  end


end
