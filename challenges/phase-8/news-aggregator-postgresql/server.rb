require "sinatra"
require "pg"
require "uri"
require_relative "./app/models/article"

set :views, File.join(File.dirname(__FILE__), "app", "views")

configure :development do
  set :db_config, { dbname: "news_aggregator_development" }
end

configure :test do
  set :db_config, { dbname: "news_aggregator_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

# # # # # # # # # # # # # # # # # # #

get "/articles" do

  results =  db_connection { |conn| conn.exec("SELECT * FROM articles").to_a }

  @articles = Article.all

  erb :articles
end

post "/articles" do

  @article = Article.new(params)

  if @article.valid?
    @article.save
    @article
    redirect "/articles"
  else
    @article
    erb :new
  end

end

get "/articles/new" do
  @article = Article.new

  erb :new
end
