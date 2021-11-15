class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :article, dependent: :destroy
  has_many :trainings, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }
  validates :objective, presence: true, length: { maximum: 140 }
  
end
