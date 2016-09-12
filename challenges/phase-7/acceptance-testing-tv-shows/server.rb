require 'sinatra'
require 'csv'
require_relative "app/models/television_show"
require 'pry'

use Rack::Session::Cookie, {
  secret: "i_love_tv",
  expire_after: 86400
}

set :views, File.join(File.dirname(__FILE__), "app/views")

get "/television_shows" do
  @title = []
  @network = []
  @starting_year = []
  @synopsis = []
  @genre = []

  CSV.foreach("television-shows.csv") do |row|
    @title << row[0]
    @network << row[1]
    @starting_year << row[2]
    @synopsis << row[3]
    @genre << row[4]
  end

  erb :index

end

get "/new" do

  if session[:repeat_entry] == true
    @repeat = true
    session[:repeat_entry] = false
  elsif session[:invalid_entry] == true
    @invalid = true
    session[:invalid_entry] = false
  end

  erb :new

end

post "/new" do

  @title = params[:title]
  @network = params[:network]
  @starting_year = params[:starting_year]
  @synopsis = params[:synopsis]
  @genre = params[:Genre]

  if TelevisionShow.valid?(@title, @network, @starting_year, @synopsis, @genre) && !TelevisionShow.repeat?(@title)
    CSV.open("television-shows.csv", "a") do |row|
    row << [@title, @network, @starting_year, @synopsis, @genre]
    end
    redirect "/television_shows"
  elsif TelevisionShow.repeat?(@title)
    session[:repeat_entry] = true
    redirect "/new"
  else
    session[:invalid_entry] = true
    redirect "/new"
  end

end
