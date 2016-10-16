class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.belongs_to :video, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
