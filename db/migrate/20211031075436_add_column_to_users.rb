class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :profile_image, :string
    add_column :users, :objective, :string
    add_column :users, :level, :integer
  end
end
