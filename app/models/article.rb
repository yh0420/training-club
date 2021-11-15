class Article < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :training, optional: true
end
