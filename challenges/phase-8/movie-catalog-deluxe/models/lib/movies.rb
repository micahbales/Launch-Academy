class Movies

  def self.all(order_by = "title", order = "ASC")

    db_connection do |conn|
      get_info = %Q(
      SELECT * FROM movies
      JOIN genres ON movies.genre_id = genres.id
      JOIN studios ON movies.studio_id = studios.id
      ORDER BY movies.#{order_by} #{order};
      )
      conn.exec_params(get_info).to_a
    end
  end

  def self.details(movie_id)

    db_connection do |conn|
      get_info = %Q(
      SELECT movies.title AS title, movies.year AS year, genres.name AS genre, studios.name AS studio, movies.id AS id
      FROM movies
      JOIN genres ON genres.id = movies.genre_id
      JOIN studios ON studios.id = movies.studio_id
      WHERE movies.id = '#{movie_id}';
      )
      conn.exec_params(get_info).to_a
    end
  end

  def self.actors_in(movie_id)

    db_connection do |conn|
      get_info = %Q(
      SELECT actors.name AS name, cast_members.character AS role, actors.id AS id
      FROM cast_members
      JOIN movies ON movies.id = cast_members.movie_id
      JOIN actors ON actors.id = cast_members.actor_id
      WHERE movies.id = '#{movie_id}';
      )
      conn.exec_params(get_info).to_a
    end
  end

end
