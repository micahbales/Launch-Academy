require 'pg'
require 'faker'

system "psql brussels_sprouts_recipes < schema.sql"

TITLES = ["Roasted Brussels Sprouts",
  "Fresh Brussels Sprouts Soup",
  "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon",
  "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries",
  "Hot Cheesy Roasted Brussels Sprout Dip",
  "Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro",
  "Roasted Brussels Sprout and Red Potato Salad",
  "Smoky Buttered Brussels Sprouts",
  "Sweet and Spicy Roasted Brussels Sprouts",
  "Smoky Buttered Brussels Sprouts",
  "Brussels Sprouts and Egg Salad with Hazelnuts"]

def db_connection
  begin
    connection = PG.connect(dbname: "brussels_sprouts_recipes")
    yield(connection)
  ensure
    connection.close
  end
end

TITLES.each do |title|
  db_connection do |conn|
    insert_info = "INSERT INTO recipes (title) VALUES ('#{title}');"
    conn.exec_params(insert_info)
  end
end

TITLES.each do |title|
  db_connection do |conn|
    insert_info = %Q(
    INSERT INTO comments (comment, name, email, recipe_id) VALUES
    ('#{Faker::Lorem.paragraph}', '#{Faker::Name.name}', '#{Faker::Internet.email}', '#{rand(11) + 1}');
    )
    conn.exec_params(insert_info)
  end
end

recipes = {}
comments = {}
recipe_count = {}
comments_count = {}
recipe_ids = {}
recipe_titles_and_ids = {}

db_connection do |conn|

  get_info = "SELECT * FROM comments"
  comments = conn.exec_params(get_info)

  get_info = "SELECT * FROM recipes"
  recipes = conn.exec_params(get_info)

  get_info = "SELECT count(*) FROM comments;"
  comments_count = conn.exec_params(get_info)

  get_info = "SELECT count(*) FROM recipes;"
  recipe_count = conn.exec_params(get_info)

  get_info = "SELECT recipe_id FROM comments"
  recipe_ids = conn.exec_params(get_info)

  get_info = "SELECT title, id FROM recipes"
  recipe_titles_and_ids = conn.exec_params(get_info)
end

recipe_count = recipe_count.to_a[0]["count"]
comments_count = comments_count.to_a[0]["count"]

puts "There are #{recipe_count} recipes and #{comments_count} comments."
puts recipe_ids.to_a.inspect
puts recipe_titles_and_ids.to_a.inspect
puts "------------"
puts comments.to_a.inspect
puts recipes.to_a.inspect

puts "------------"

totals = {1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0, 8 => 0, 9 => 0, 10 => 0, 11 => 0, 12 => 0, 13 => 0}
comments.each do |comment|
  totals[comment["recipe_id"].to_i] += 1
end

recipes.each do |recipe|

  puts "#{recipe["title"]} has #{totals[recipe["id"].to_i]} comments"
end

puts "------------"

puts "comment #5 refers to the recipe #{recipes.to_a[comments.to_a[4]["recipe_id"].to_i - 1]["title"]}"

puts "------------"

db_connection do |conn|
  insert_info = %Q(
  INSERT INTO recipes (title) VALUES
  ('Brussels Sprouts with Goat Cheese');
  )
  conn.exec_params(insert_info)
end

db_connection do |conn|
  get_info = "SELECT * FROM recipes"
  recipes = conn.exec_params(get_info)
end

db_connection do |conn|
  insert_info = %Q(
  INSERT INTO comments (comment, name, email, recipe_id) VALUES
  ('#{Faker::Lorem.paragraph}', '#{Faker::Name.name}', '#{Faker::Internet.email}', '#{recipes.to_a[-1]["id"]}'),
  ('#{Faker::Lorem.paragraph}', '#{Faker::Name.name}', '#{Faker::Internet.email}', '#{recipes.to_a[-1]["id"]}');
  )
  conn.exec_params(insert_info)
end

db_connection do |conn|

  get_info = "SELECT * FROM comments"
  comments = conn.exec_params(get_info)

end

puts recipes.to_a
puts comments.to_a

puts "--------------"

new_comments = {}
db_connection do |conn|

  get_info = %Q(
  SELECT * FROM comments
  WHERE recipe_id = 11;
  )
  new_comments = conn.exec_params(get_info)

end

comments.each do |comment|
  totals[comment["recipe_id"].to_i] += 1
end

puts "#{recipes.to_a[-1]["title"]} has #{totals[recipes.to_a[-1]["id"].to_i]} comments"
