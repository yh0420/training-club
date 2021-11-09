class RenameTypeColumnToTrainings < ActiveRecord::Migration[6.0]
  def change
    rename_column :trainings, :type, :name
  end
end
