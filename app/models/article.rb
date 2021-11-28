class Article < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :training, optional: true

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :avatar
  def like_count
    likes.count
  end
end
