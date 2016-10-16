FactoryGirl.define do
  factory :genre do
    sequence(:name) { |n| "Genre Name ##{n}"}
  end
end
