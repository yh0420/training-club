class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :article, dependent: :destroy
  has_many :trainings, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorite_articles, through: :likes, source: :article

  has_one_attached :avatar

    def has_liked?(article)
      likes.exists?(article_id: article.id)
    end

    def self.guest
      find_or_create_by!(email: 'guest@example.com') do |user|
        user.password = SecureRandom.urlsafe_base64
        user.name = "ゲストユーザー"
        user.objective = "毎日5分運動する"
    end
  end
end