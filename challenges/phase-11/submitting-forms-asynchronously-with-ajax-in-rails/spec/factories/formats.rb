FactoryGirl.define do
  factory :format do
    sequence(:name) { |n| "Unpopular video format acronym ##{n}" }
  end
end
