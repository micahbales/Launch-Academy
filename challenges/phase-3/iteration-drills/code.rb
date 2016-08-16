require 'pry'
#Write Ruby<->English answers here as comments in your code

array = [28214, 63061, 49928, 98565, 31769, 42316, 23674, 3540, 34953, 70282, 22077, 94710, 50353, 17107, 73683, 33287, 44575, 83602, 33350, 46583]

# Write Ruby code to find out the answers to the following questions:

# * What is the sum of all the numbers in `array`?
sum = 0
array.each do |item|
  sum += item
end
puts sum
# * How would you print out each value of the array?
array.each do |item|
  print "#{item}, "
end
puts ""
# * What is the sum of all of the even numbers?
sum = 0
array.each do |item|
  if item % 2 == 0
    sum += item
  end
end
puts sum
# * What is the sum of all of the odd numbers?
array.each do |item|
  if item % 2 != 0
    sum += item
  end
end
puts sum
# * What is the sum of all the numbers divisble by 5?
array.each do |item|
  if item % 5 == 0
    sum += item
  end
end
puts sum
# * What is the sum of the squares of all the numbers in the array?
array.each do |item|
  sum += (item * item)
end
puts sum

array = ["joanie", "annamarie", "muriel", "drew", "reva", "belle", "amari", "aida", "kaylie", "monserrate", "jovan", "elian", "stuart", "maximo", "dennis", "zakary", "louvenia", "lew", "crawford", "caitlyn"]

# Write Ruby code to find out the answers to the following questions:

# * How would you print out each name backwards in `array`?
array.each do |name|
  puts name.reverse
end
# * What are the total number of characters in the names in `array`?
sum = 0
array.each do |name|
  sum += name.size
end
puts sum
# * How many names in `array` are less than 5 characters long?
short_names = 0
array.each do |name|
  if name.length < 5
    short_names += 1
  end
end
puts short_names
# * How many names in `array` end in a vowel?
end_in_vowel = 0
array.each do |name|
  if name[-1] == "a" || name[-1] == "e" || name[-1] == "i" || name[-1] == "o" || name[-1] == "u" || name[-1] == "y"
  end_in_vowel += 1
  end
end
puts end_in_vowel
# * How many names in `array` are more than 5 characters long?
long_names = 0
array.each do |name|
  if name.length > 5
    long_names += 1
  end
end
puts long_names
# * How many names in `array` are exactly 5 characters in length?
five_long = 0
array.each do |name|
  if name.length == 5
    five_long += 1
  end
end
puts five_long

best_records = {
 "Tupac"=>"All Eyez on Me",
 "Eminem"=>"The Marshall Mathers LP",
 "Wu-Tang Clan"=>"Enter the Wu-Tang (36 Chambers)",
 "Led Zeppelin"=>"Physical Graffiti",
 "Metallica"=>"The Black Album",
 "Pink Floyd"=>"The Dark Side of the Moon",
 "Pearl Jam"=>"Ten",
 "Nirvana"=>"Nevermind"
 }

#  Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of the artists?
best_records.each do |artist, album|
  puts artist
end
# * How would you print out all the names of the albums?
best_records.each do |artist, album|
  puts album
end
# * Which artist has the longest name?
longest_artist = ""
best_records.each do |artist, album|
  if artist.length > longest_artist.length
    longest_artist = artist
  end
end
puts longest_artist
# * How would you change all the album titles for every artist to `Greatest Hits`?
best_records.each do |artist, album|
  best_records[artist] = "Greatest Hits"
end
puts best_records.inspect
# * How would you delete a key-value pair if the artist's name ends in a vowel?
best_records.each do |artist, album|
  if artist[-1] == "a" || artist[-1] == "e" || artist[-1] == "i" || artist[-1] == "o" || artist[-1] == "u" || artist[-1] == "y"
    best_records.delete(artist)
  end
end
puts best_records.inspect

ages = {"Arch"=>89, "Gretchen"=>93, "Simone"=>12, "Daija"=>96, "Alivia"=>22, "Serena"=>28, "Alek"=>3, "Lula"=>24, "Christian"=>62, "Darryl"=>47, "Otha"=>32, "Evalyn"=>44, "Lincoln"=>27, "Rebeca"=>99, "Beatrice"=>99, "Kelton"=>10, "Zachary"=>18, "Aurelie"=>91, "Dell"=>71, "Lisandro"=>22}

# Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of `ages`?
ages.each do |name, age|
  print "#{name}, "
end
puts ""
# * How would you print out each key-value pair in the format of `<name> is <age> years old.`?
ages.each do |name, age|
  puts "#{name} is #{age} years old."
end
# * How would you print out every person with odd numbered age?
ages.each do |name, age|
  if age % 3 == 0
    print "#{name}, "
  end
end
puts ""
# * How would you delete everyone under 25 years of age?
ages.each do |name, age|
  if age < 25
    ages.delete(name)
  end
end
puts ages
# * What is the name and age of everyone with a name greater than or equal to 5 characters?
ages.each do |name, age|
  if name.length < 5
    ages.delete(name)
  end
end
puts ages

people =
{
  "Alia O'Conner PhD" => {
         "phone" => "538.741.1841",
       "company" => "Leuschke-Stiedemann",
      "children" => [
          "Simone",
          "Cindy",
          "Jess"
      ]
  },
           "Ike Haag" => {
         "phone" => "(661) 663-8352",
       "company" => "Carter Inc",
      "children" => [
          "Joe",
          "Ofelia",
          "Deron"
      ]
  },
       "Brian Heller" => {
         "phone" => "1-288-601-5886",
       "company" => "O'Conner Group",
      "children" => [
          "Renee"
      ]
  },
       "Maryse Johns" => {
         "phone" => "218-571-8774",
       "company" => "Kuhlman Group",
      "children" => [
          "Dominick",
          "Tricia"
      ]
  },
  "Dr. Adela DuBuque" => {
        "phone" => "1-203-483-1226",
      "company" => "Heidenreich, Nietzsche and Dickinson"
  }
}

# Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of `people`?
people.each do |person|
  puts person[1]["company"]
end
# * How would you print out all the names of `people` and which company they work for?
people.each do |person|
  puts "#{person[0]} works for #{person[1]["company"]}"
end
# * What are the names of all the children of everyone in `people`?
people.each do |key, value|
  if value["children"]
    value["children"].each do |child|
      puts child
    end
  end
end
# * What are the names of all the companies that people work for?
people.each do |key, value|
  print "#{value["company"]}, "
end
puts ""
# * How would you convert all the phone numbers to the same standard (pick one)?
people.each do |key, value|
  formatted_number = value["phone"]
  .gsub(' ', '')
  .gsub('(', '')
  .gsub(')', '.')
  .gsub('-', '.')
  puts formatted_number
end

people =
[
    {
          "Derek Wehner" => {
               "phone" => "588-047-7782",
             "company" => "Daniel-Carroll",
            "children" => [
                "Phoebe",
                "Gretchen",
                "Wiley"
            ]
        },
           "Ali Koelpin" => {
               "phone" => "1-127-057-0020",
             "company" => "Rau, Rutherford and Lockman",
            "children" => [
                "Juwan"
            ]
        },
        "Ervin Prohaska" => {
               "phone" => "(393) 630-3354",
             "company" => "Carter Inc",
            "children" => [
                "Virgil",
                "Piper",
                "Josianne"
            ]
        },
          "Hellen Borer" => {
              "phone" => "1-687-825-0947",
            "company" => "Maggio, Ferry and Moen"
        }
    },
    {
        "Elinor Johnson" => {
              "phone" => "819.911.5553",
            "company" => "Pollich Group"
        }
    },
    {
        "Richmond Murray" => {
               "phone" => "1-516-432-2364",
             "company" => "Sporer and Sons",
            "children" => [
                "Kade",
                "Sage"
            ]
        },
            "Nakia Ferry" => {
               "phone" => "134-079-2237",
             "company" => "Hamill, O'Keefe and Lehner",
            "children" => [
                "Rollin"
            ]
        }
    }
]

# Write Ruby code to find out the answers to the following questions:

# * What are the names of everyone in `people`?
people[0].each do |key, value|
  puts key
end
# * What are the names of all the children in `people`?
people[0].each do |key, value|
  if value["children"]
    value["children"].each do |child|
      puts child
    end
  end
end
# * How would you create a new hash called `phone_numbers` that has a key of a name and value of a phone number in `people`?
phone_numbers = {}
people[0].each do |name, details|
  phone_numbers[name] = people[0][name]["phone"]
end
puts phone_numbers.inspect
# * How would you create a new hash called `employers` that has a key of a name and a value of a company name in `people`?
employers = {}
people[0].each do |name, details|
  employers[name] = people[0][name]["company"]
end
puts employers
# * How would you create a new hash called `children_count` that has a key of a name and a value of the number of children a person has?
children = {}
people[0].each do |name, details|
  if people[0][name]["children"]
    children[name] = people[0][name]["children"].length
  end
end
puts children
