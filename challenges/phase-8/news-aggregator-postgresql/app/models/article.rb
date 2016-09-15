class Article

  attr_reader :title, :url, :description, :id, :errors

  def initialize(article = {})
    @title = article["title"]
    @url = article["url"]
    @description = article["description"]
    @id = article["id"]
    @errors = []
  end

  def save
    if valid?

      db_connection do |conn|
        conn.exec_params("INSERT INTO articles (title, url, description) VALUES ($1, $2, $3)", [@title, @url, @description])
      end

      true

    else
      false
    end
  end

  def valid?

    valid = true

    unless Article.valid_url?(@url)

      valid = false
      @errors << "Invalid URL"

    end

    if @title == "" || @url == "" || @description == "" || @title == nil || @url == nil || @description == nil
      valid = false
      @errors << "Please completely fill out form"

    end

    if @description.length < 20 && @description != ""

      valid = false
      @errors << "Description must be at least 20 characters long"

    end

    if Article.repeat_url?(@url) && @url != "" && @description.length > 20

      valid = false
      @errors << "Article with same url already submitted"

    end

    if Article.repeat_title?(@title) && !Article.repeat_url?(@url) && @title != "" && @description.length > 20

      valid = false
      @errors << "It appears we already have that article. Please submit a unique article"

    end

    valid
  end

  def self.all
    results =  db_connection { |conn| conn.exec("SELECT * FROM articles").to_a }

    articles = []

    results.each do |result|
      articles << Article.new(result)
    end

    if articles == []
      articles = Article.new({"title" => "", "url" => "", "description" => "", "id" => "0"})
    end

    articles
  end

  def self.valid_url?(url)
    begin
      true if URI.parse(url)
    rescue URI::InvalidURIError
      false
    end
  end

  def self.repeat_title?(title)
    results =  db_connection { |conn| conn.exec("SELECT * FROM articles").to_a }

    results.each do |result|
      if result["title"] == title
        return true
      end
    end
    false
  end

  def self.repeat_url?(url)
    results =  db_connection { |conn| conn.exec("SELECT * FROM articles").to_a }

    results.each do |result|
      if result["url"] == url
        return true
      end
    end
    false
  end


end
