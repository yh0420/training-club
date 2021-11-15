class Training < ApplicationRecord
  belongs_to :user, optional: true
  has_many :article, dependent: :destroy
  validates :name, presence: true, length: { maximum: 30 }
end
