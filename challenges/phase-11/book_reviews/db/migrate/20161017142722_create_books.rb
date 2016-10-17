class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.datetime :published_at, null: false
      t.belongs_to :author, foreign_key: true, null: false

      t.timestamps
    end
  end
end
