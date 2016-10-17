FactoryGirl.define do
  factory :review do
    body "A++++ would read again!!!!!!!!"
    rating 10

    association :book, factory: :book # or simply, `book`
    association :user, factory: :user # or simply, `user`
  end
end
