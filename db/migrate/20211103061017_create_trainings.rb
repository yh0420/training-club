class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
