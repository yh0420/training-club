class AddNameToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :name, :string
  end
end
