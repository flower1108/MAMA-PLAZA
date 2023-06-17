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

  before_create :default_image

  def default_image
    if !self.profile_image.attached?
      self.profile_image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'profile-noimage.png')), filename: 'profile-noimage.png', content_type: 'image/png')
    end
  end
  #ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
