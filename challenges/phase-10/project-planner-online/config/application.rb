# For all environments, run the following code
configure do
  # Load the following libraries
  require 'sinatra/activerecord'
  require 'sinatra/flash'
  require 'pry'

  # Load all .rb files in the app folder
  Dir[__dir__ + "/../app/**/*.rb"].each do |file|
    require_relative file
  end

  # Declare the location of the views folder
  set :views, 'app/views'
end
