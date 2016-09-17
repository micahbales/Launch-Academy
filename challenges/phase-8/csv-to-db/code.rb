require 'pg'
require 'csv'
require 'pry'

system "psql ingredients < schema.sql"

def db_connection
  begin
    connection = PG.connect(dbname: "ingredients")
    yield(connection)
  ensure
    connection.close
  end
end

CSV.foreach("ingredients.csv") do |row|
  db_connection do |conn|
    insert_info = %Q(
    INSERT INTO ingredients (id, title) VALUES
    ('#{row[0]}', '#{row[1]}');
    )
    conn.exec_params(insert_info)
  end
end

ingredients = {}
db_connection do |conn|
  get_info = "SELECT * FROM ingredients;"
  ingredients = conn.exec(get_info)
end

ingredients.each do |ingredient|
  puts "#{ingredient["id"]}. #{ingredient["title"]}"
end
