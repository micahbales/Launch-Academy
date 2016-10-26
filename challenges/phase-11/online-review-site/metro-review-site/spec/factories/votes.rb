FactoryGirl.define do
  factory :vote do
    association :user, factory: :user
    association :review, factory: :review
    value 1
  end
end
