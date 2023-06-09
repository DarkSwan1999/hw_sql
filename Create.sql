CREATE TABLE genres (
id SERIAL PRIMARY KEY,
name TEXT NOT NULL
);

CREATE TABLE artists (
id SERIAL PRIMARY KEY,
name TEXT NOT NULL
);

CREATE TABLE albums (
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
year INTEGER NOT NULL
);

CREATE TABLE tracks (
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
duration INTERVAL NOT NULL,
album_id INTEGER NOT NULL REFERENCES albums(id)
);

CREATE TABLE artist_genre (
artist_id INTEGER NOT NULL REFERENCES artists(id),
genre_id INTEGER NOT NULL REFERENCES genres(id),
PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE album_artist (
album_id INTEGER NOT NULL REFERENCES albums(id),
artist_id INTEGER NOT NULL REFERENCES artists(id),
PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE compilations (
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
year INTEGER NOT NULL
);

CREATE TABLE compilation_track (
compilation_id INTEGER NOT NULL REFERENCES compilations(id),
track_id INTEGER NOT NULL REFERENCES tracks(id),
PRIMARY KEY (compilation_id, track_id)
);