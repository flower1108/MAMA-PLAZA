class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :post, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #before_create :default_image

  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/profile-noimage.png')
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
    end
  end
end
