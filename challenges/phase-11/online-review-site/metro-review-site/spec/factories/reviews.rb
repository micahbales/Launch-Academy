FactoryGirl.define do
  factory :review do
    sequence(:title) { |n| "My Opinion #{n}"}
    content "This station is lovely, but it could use some cleaning up!"
    association :station, factory: :station
  end
end
