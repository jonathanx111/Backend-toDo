class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :user
      t.belongs_to :day
      t.string :description
      t.integer :points
      t.boolean :done
      t.timestamps
    end
  end
end
