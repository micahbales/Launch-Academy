require "sinatra"
require "csv"
require "uri"

get "/articles" do

  @articles = File.readlines("articles.csv")

  @articles_name = []
  @articles_url = []
  @articles_description = []

  CSV.foreach("articles.csv") do |row|
    @articles_name << row[0]
    @articles_url << row[1]
    @articles_description << row[2]
  end

  erb :articles
end

post "/articles" do

  @article_name = params[:article_name]
  @article_url = params[:article_url]
  @article_description = params[:article_description]
  def valid?(url)
    uri = URI.parse(url)
    rescue URI::InvalidURIError
      false
  end
  def repeat?(arg1, arg2, arg3)
    CSV.foreach("articles.csv") do |row|
      if row.include?(arg1) || row.include?(arg2) || row.include?(arg3)
        return true
      end
    end
    false
  end

  if @article_name.empty? || @article_url.empty? || @article_description.length < 20 || !valid?(@article_url)

    @error_message = "Please enter valid information"
    erb :new

  elsif repeat?(@article_name, @article_url, @article_description)

    @error_message = "It appears we already have that article. Please submit a unique article"
    erb :new

  else

    CSV.open("articles.csv", "a") do |csv|
      csv << [@article_name, @article_url, @article_description]
    end

    redirect "/articles"
  end
end

get "/articles/new" do
  erb :new
end
