class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :post, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #フォローした・されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  #フォロー一覧用
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true
  #validates :password, presence: true, length: { minimum: 6 }, confirmation: { type: :password, message: :wrong_password_confirmation }

  #フォローした時の処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  #フォローを外す時の処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  #フォローしているかの判定
  def following?(user)
    followings.include?(user)
  end

  #検索
  def self.looks(search, word)
    @user = User.where("name LIKE?","%#{word}%")
  end

  #before_create :default_image

  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/MAMA-PLAZA.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image
  end

  #def default_image
    #if !self.profile_image.attached?
      #self.profile_image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'profile-noimage.png')), filename: 'profile-noimage.png', content_type: 'image/png')
    #end
  #end
  #ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
      user.introduction = "このユーザーはゲストユーザーです。"
    end
  end
end
