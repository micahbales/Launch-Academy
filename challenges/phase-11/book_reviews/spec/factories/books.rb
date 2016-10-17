FactoryGirl.define do
  factory :book do
    title "Green Eggs and Ham"
    published_at "1960-08-12"

    association :author, factory: :author # or simply `author`
  end
end
