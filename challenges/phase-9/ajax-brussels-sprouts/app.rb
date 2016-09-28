require 'sinatra'
require 'sinatra/json'
require 'json'
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

configure do
  set :public_folder, 'public'
end

dishes = [
  "Roasted Brussels Sprouts",
  "Fresh Brussels Sprouts Soup",
  "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon",
  "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries",
  "Hot Cheesy Roasted Brussels Sprout Dip",
  "Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro",
  "Roasted Brussels Sprout and Red Potato Salad",
  "Smoky Buttered Brussels Sprouts",
  "Sweet and Spicy Roasted Brussels Sprouts",
  "Smoky Buttered Brussels Sprouts",
  "Brussels Sprouts and Egg Salad with Hazelnuts"
]

get '/' do
  erb :index
end

get '/dishes/random.json' do

  content_type :json
  { dish: dishes.sample }.to_json
  # serve up a random dish from the `dishes` array
end
