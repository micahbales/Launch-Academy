ENV["RACK_ENV"] ||= "test"
require "rspec"
require "capybara/rspec"

require_relative "../server"
require_relative "../app/models/television_show"

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.before(:suite) do
    CSV.open('television-shows.csv', 'w') do |file|
     file.puts(['title', 'network', 'starting_year', 'synopsis', 'genre'])
    end
  end

  config.after(:each) do
    CSV.open('television-shows.csv', 'w') do |file|
     file.puts(['title', 'network', 'starting_year', 'synopsis', 'genre'])
    end
  end
end
