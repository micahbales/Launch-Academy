--  DO NOT MODIFY THIS FILE. IT IS ONLY USED BY THE TEST DATABASE.
CREATE TABLE actors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP,
  update_at TIMESTAMP
);


CREATE TABLE cast_members (
  id SERIAL PRIMARY KEY,
  movie_id INTEGER NOT NULL,
  actor_id INTEGER NOT NULL,
  created_at TIMESTAMP,
  update_at TIMESTAMP,
  character VARCHAR(255)
);

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  year INTEGER NOT NULL,
  synopsis TEXT,
  rating INTEGER,
  created_at TIMESTAMP,
  update_at TIMESTAMP,
  genre_id INTEGER NOT NULL,
  studio_id INTEGER
);

CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP,
  update_at TIMESTAMP
);

CREATE TABLE studios (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP,
  update_at TIMESTAMP
);
