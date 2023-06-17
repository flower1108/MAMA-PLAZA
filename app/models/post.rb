class Post < ApplicationRecord
  has_one_attached :post_image

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #お気に入り
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  #検索
  def self.looks(search, word)
    @post = Post.where("title LIKE?","%#{word}%")
  end

  def get_post_image
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.png')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_image
  end


end
