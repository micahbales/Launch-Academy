voter_data = {
  "Jon Smith" => {
    age: 25,
    income: 50_000,
    household_size: 1,
    gender: "Male",
    education: "College"
  },
  "Jane Davies" => {
    age: 30,
    income: 60_000,
    household_size: 3,
    gender: "Female",
    education: "High School"
  },
  "Sam Farelly" => {
    age: 32,
    income: 80_000,
    household_size: 2,
    gender: "Unspecified",
    education: "College"
  },
  "Joan Favreau" => {
    age: 35,
    income: 65_000,
    household_size: 4,
    gender: "Female",
    education: "College"
  },
  "Sam McNulty" => {
    age: 38,
    income: 63_000,
    household_size: 3,
    gender: "Male",
    education: "College"
  },
  "Mark Minahan" => {
    age: 48,
    income: 78_000,
    household_size: 5,
    gender: "Male",
    education: "High School"
  },
  "Susan Umani" => {
    age: 45,
    income: 75_000,
    household_size: 2,
    gender: "Female",
    education: "College"
  },
  "Bill Perault" => {
    age: 24,
    income: 45_000,
    household_size: 1,
    gender: "Male",
    education: "Did Not Complete High School"
  },
  "Doug Stamper" => {
    age: 45,
    income: 75_000,
    household_size: 1,
    gender: "Male",
    education: "College"
  },
  "Francis Underwood" => {
    age: 52,
    income: 100_000,
    household_size: 2,
    gender: "Male",
    education: "College"
  },
}

total_age = 0
voter_data.each do |key, value|
  total_age += value[:age].to_f
end
average_age = total_age / voter_data.length
puts "Average Age: #{average_age}"

total_income = 0
voter_data.each do |key, value|
  total_income += value[:income].to_f
end
average_income = total_income / voter_data.length
puts "Average Income: $#{average_income}"

total_household_size = 0
voter_data.each do |key, value|
  total_household_size += value[:household_size].to_f
end
average_household_size = total_household_size / voter_data.length
puts "Average Household Size: #{average_household_size}"

females = 0
voter_data.each do |key, value|
  if value[:gender] == "Female"
    females += 1
  end
end
percent_female = (voter_data.length / females).to_f * 10
puts "Female: #{percent_female}%"

males = 0
voter_data.each do |key, value|
  if value[:gender] == "Male"
    males += 1
  end
end
percent_male = males / voter_data.length.to_f * 100
puts "Male: #{percent_male}%"

unspecifieds = 0
voter_data.each do |key, value|
  if value[:gender] == "Unspecified"
    unspecifieds += 1
  end
end
percent_unspecified = unspecifieds / voter_data.length.to_f * 100
puts "Unspecified Gender: #{percent_unspecified}%"

college = 0
voter_data.each do |key, value|
  if value[:education] == "College"
    college += 1
  end
end
percent_college = college / voter_data.length.to_f * 100
puts "College: #{percent_college}%"

high_school = 0
voter_data.each do |key, value|
  if value[:education] == "High School"
    high_school += 1
  end
end
percent_high_school = high_school / voter_data.length.to_f * 100
puts "High School: #{percent_high_school}%"

no_high_school = 0
voter_data.each do |key, value|
  if value[:education] == "Did Not Complete High School"
    no_high_school += 1
  end
end
percent_no_high_school = no_high_school / voter_data.length.to_f * 100
puts "Did Not Finish High School: #{percent_no_high_school}%"
