class AddTrainingsRefToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :training, foreign_key: true
  end
end
