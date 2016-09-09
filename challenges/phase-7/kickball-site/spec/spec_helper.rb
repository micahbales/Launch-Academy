require "rspec"
require "capybara"
require "sinatra"
require "capybara/rspec"
require_relative "../lib/team_data"
require_relative "../models/player"
require_relative "../models/team"
require_relative "../app"

Capybara.app = Sinatra::Application
