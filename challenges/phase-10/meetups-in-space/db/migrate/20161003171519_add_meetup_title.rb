class AddMeetupTitle < ActiveRecord::Migration
  def change
    add_column(:meetups, :title, :string, option = {null: false})
  end
end
