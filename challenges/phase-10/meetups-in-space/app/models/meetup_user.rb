class MeetupUser < ActiveRecord::Base
  belongs_to :meetup
  belongs_to :user
end


# MeetupUser.create(meetup_id: meetup_id, user_id: user_id)
