# server.rb
require "sinatra"
require "sinatra/activerecord"

set :bind, '0.0.0.0'  # bind to all interfaces
