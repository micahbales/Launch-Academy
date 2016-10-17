FactoryGirl.define do
  factory :recipe do
    name "MyString"
    description "MyText"
    instructions "MyText"
    servings 1
    cooking_time 1
  end
end
