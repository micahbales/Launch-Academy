FactoryGirl.define do
  factory :video do
    sequence(:title) { |n| "Awesomesauce Film, part #{n}" }
    year 1999
    description "All the awesomeness in one glorious piece of cinema."
    genre
    format
  end
end
