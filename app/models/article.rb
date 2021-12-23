class Article < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :training, optional: true

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :avatar
  has_one_attached :eyecatch
  validates :body, presence: true, length: { maximum: 140 }
  validates :minutes, presence: true, numericality: { only_integer: true }, inclusion: { in: 0..360 }

  
  def like_count
    likes.count
  end
  def comment_count
    comments.count
  end
end
