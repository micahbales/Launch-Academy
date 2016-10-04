class AddCreatorToMeetups < ActiveRecord::Migration
  def change
    add_column(:meetups, :creator, :string)
  end
end
