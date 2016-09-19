class Actors

  def initialize
  end

  def self.all

    db_connection do |conn|
      get_info = %Q(
      SELECT name, id FROM actors ORDER BY name ASC;
      )
      actors = conn.exec(get_info).to_a
      array = []
      actors.each do |actor|
        array << {:name => actor["name"], :id => actor["id"]}
      end
      array
    end

  end

  def self.movies_with(actor_id, order_by = "year", order = "DESC")

    db_connection do |conn|
      get_info = %Q(
      SELECT movies.title AS title, movies.year AS year, genres.name AS genre, cast_members.character AS role, movies.id AS id
      FROM movies
      JOIN genres ON movies.genre_id = genres.id
      JOIN cast_members ON cast_members.movie_id = movies.id
      JOIN actors ON actors.id = cast_members.actor_id
      WHERE actors.id = '#{actor_id}'
      ORDER BY movies.#{order_by} #{order};
      )
      conn.exec_params(get_info).to_a
    end
  end

  def self.name_of_id(actor_id)
    db_connection do |conn|
      get_info = %Q(
      SELECT name FROM actors
      WHERE actors.id = '#{actor_id}';
      )
      results = conn.exec_params(get_info)
      results.to_a[0]["name"]
    end
  end

end
