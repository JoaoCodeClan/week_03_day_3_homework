DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS artist;

CREATE TABLE artist(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);


CREATE TABLE album(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT8 REFERENCES artist(id)
);
