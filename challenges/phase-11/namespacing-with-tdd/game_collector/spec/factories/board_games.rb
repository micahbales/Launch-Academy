FactoryGirl.define do
  factory :board_game do
    sequence(:name) { |n| "Ticket to Ride, Edition ##{n}" }
    publisher 'Days of Wonder'
    description 'Build train routes throughout a continent.'
    min_players 2
    max_players 5
    release_date '2000/01/30'
  end
end
