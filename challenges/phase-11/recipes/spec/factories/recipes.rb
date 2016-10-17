FactoryGirl.define do
  factory :recipe do
    sequence(:name) { |n| "Brussels Sprouts with Bacon #{n}" }
    description "The best side-dish, ever."
    instructions "Brussels + Bacon + Heat"
    servings 4
    cooking_time 45
  end
end
