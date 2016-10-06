class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :description
      t.string :due_date
      t.integer :user_id
      t.integer :project_id, null: false
    end
  end
end
