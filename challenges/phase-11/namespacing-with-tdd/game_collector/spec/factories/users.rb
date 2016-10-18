FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "gamefan#{n}@gmail.com" }
    password 'password'
    password_confirmation 'password'
    role 'user'
   end
end
