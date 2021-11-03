class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.date :day, null: false
      t.integer :minutes, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
