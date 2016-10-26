FactoryGirl.define do
  factory :user do
    first_name "Bob"
    last_name "Builder"
    email "bob@thebuilder.com"
    password "password"
    admin false
  end
end
