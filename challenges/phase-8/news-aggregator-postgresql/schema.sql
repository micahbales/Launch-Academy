DROP TABLE IF EXISTS articles;

CREATE TABLE articles (
  id serial PRIMARY KEY,
  title varchar(500) UNIQUE NOT NULL,
  url varchar(500) UNIQUE NOT NULL,
  description varchar(500) UNIQUE,
  dateCreated timestamp DEFAULT current_timestamp
);
