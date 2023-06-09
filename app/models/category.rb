class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :name, presence: true, length: { maximum: 20 }
end
