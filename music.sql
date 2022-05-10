-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists (
    id SERIAL PRIMARY KEY,
    artist_name TEXT NOT NULL
);

CREATE TABLE producers (
    id SERIAL PRIMARY KEY,
    producer_name TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL
);

CREATE TABLE artist_song (
  id SERIAL PRIMARY KEY,
  artist_id INTEGER REFERENCES artists (id) ON DELETE CASCADE,
  song_id INTEGER REFERENCES songs (id) ON DELETE CASCADE
);

CREATE TABLE producer_song (
  id SERIAL PRIMARY KEY,
  producer_id INTEGER REFERENCES producers (id) ON DELETE CASCADE,
  song_id INTEGER REFERENCES songs (id) ON DELETE CASCADE
);


INSERT INTO songs
  (title, duration_in_seconds, release_date, album)
VALUES
  ('MMMBop', 238, '04-15-1997', 'Middle of Nowhere'),
  ('Bohemian Rhapsody', 355, '10-31-1975', 'A Night at the Opera'),
  ('One Sweet Day', 282, '11-14-1995', 'Daydream'),
  ('Shallow', 216, '09-27-2018', 'A Star Is Born'),
  ('How You Remind Me', 223, '08-21-2001', 'Silver Side Up'),
  ('New York State of Mind', 276, '10-20-2009', 'The Blueprint 3'),
  ('Dark Horse', 215, '12-17-2013', 'Prism'),
  ('Moves Like Jagger', 201, '06-21-2011', 'Hands All Over'),
  ('Complicated', 244, '05-14-2002', 'Let Go'),
  ('Say My Name', 240, '11-07-1999', 'The Writing''s on the Wall');

INSERT INTO artists
  (artist_name)
VALUES
('Alicia Keys'),
('Avril Lavigne'),
('Boyz II Men'),
('Bradley Cooper'),
('Christina Aguilera'),
('Destiny''s Child'),
('Hanson'),
('Jay Z'),
('Juicy J'),
('Katy Perry'),
('Lady Gaga'),
('Mariah Cary'),
('Maroon 5'),
('Nickelback'),
('Queen');

INSERT INTO producers
  (producer_name)
VALUES
('Al Shux'),
('Benjamin Rice'),
('Benny Blanco'),
('Cirkut'),
('Darkchild'),
('Dust Brothers'),
('Max Martin'),
('Rick Parashar'),
('Roy Thomas Baker'),
('Shellback'),
('Stephen Lironi'),
('The Matrix'),
('Walter Afanasieff');

INSERT INTO artist_song
  (artist_id, song_id)
VALUES
('7', '1'),
('15', '2'),
('12', '3'),
('3', '3'),
('11', '4'),
('4', '4'),
('14', '5'),
('8', '6'),
('1', '6'),
('10', '7'),
('9', '7'),
('13', '8'),
('5', '8'),
('2', '9'),
('6', '10');

INSERT INTO producer_song
  (producer_id, song_id)
VALUES
('6', '1'),
('11', '1'),
('9', '2'),
('13', '3'),
('2', '4'),
('8', '5'),
('1', '6'),
('7', '7'),
('4', '7'),
('10', '8'),
('3', '8'),
('12', '9'),
('5', '10');


-- SELECT * FROM songs;
-- SELECT * FROM artists;
-- SELECT * FROM producers;

-- SELECT s.title, s.duration_in_seconds, s.release_date, s.album, a.artist_name, p.producer_name FROM songs s
-- FULL JOIN artist_song t
-- ON t.song_id = s.id
-- JOIN producer_song d
-- ON d.song_id = s.id
-- JOIN artists a
-- ON t.artist_id = a.id
-- JOIN producers p
-- ON d.producer_id = p.id;


