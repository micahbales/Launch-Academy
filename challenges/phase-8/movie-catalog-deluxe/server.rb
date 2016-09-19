require "sinatra"
require "pg"
require "pry"
require_relative "models/lib/actors"
require_relative "models/lib/movies"

configure :development do
  set :db_config, { dbname: "movies" }
end

configure :test do
  set :db_config, { dbname: "movies_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

get "/actors/" do

  @actors = Actors.all

  erb :"actors/index"

end

get "/actors" do
  redirect "/actors/"
end

get "/actors/:id" do

  @actor_name = Actors.name_of_id(params[:id])
  @movies = Actors.movies_with(params[:id])

  erb :"actors/show"

end

get "/actors/:id/" do
  redirect "/actors/:id"
end

get "/movies/" do

  @movies = Movies.all

  erb :"movies/index"

end

get "/movies" do
  redirect "/movies/"
end

get "/movies/:id" do

  @movie = Movies.details(params[:id])
  @actors = Movies.actors_in(params[:id])

  erb :"movies/show"

end

get "/movies/:id/" do
  redirect "/movies/:id"
end
