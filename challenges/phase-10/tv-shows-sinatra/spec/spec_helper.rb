require "rspec"
require "capybara/rspec"
require "database_cleaner"

require_relative "../server"

set :environment, :test

Capybara.app = Sinatra::Application
ActiveRecord::Base.logger.level = 1

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
