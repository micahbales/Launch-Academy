ENV["RACK_ENV"] ||= "test"
require 'rspec'
require 'capybara/rspec'
require 'capybara/poltergeist'

require_relative '../app.rb'
Dir[__dir__ + '/support/*.rb'].each { |file| require_relative file }

Capybara.app = Sinatra::Application
Capybara.javascript_driver = :poltergeist
