require "nokogiri"
require "pry"
require "net/http"

data = "content=he who can destroy a thing, controls a thing"

connection = Net::HTTP.new('launch-academy-chat.herokuapp.com')

connection.post( '/messages' , data )

response2 = Net::HTTP.get('launch-academy-chat.herokuapp.com', '/messages')

html = Nokogiri::HTML(response2)
html.css("div.pure-u-1-2").each do |username|
  puts "* " + username.text.strip
end
