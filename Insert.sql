insert into genres (name) values
('Rock'),
('Pop'),
('Hip-hop'),
('Jazz'),
('Electronic');

insert into artists (name) values
('Queen'),
('Michael Djacson'),
('Byeonce'),
('The Beatles'),
('Alla Pugachova'),
('Stas Michaelov'),
('Eminem'),
('Pink Floyd');

insert into albums (name, year) values
('Bohem Rapsodia', 1975, 1),
('Thriller', 1982, 2),
('Old the singl ladyes', 2008, 3),
('Abbey Road', 1969, 4),
('Zerkalo dushi', 1978, 5),
('Ti - vse', 2017, 6),
('Encore', 2004, 7),
('The dark side of the moon', 1973,8);

INSERT INTO tracks (name, duration, album_id) VALUES
('We Will Rock You', '00:02:01', 1),
('Bohemian Rhapsody', '00:05:54', 1),
('Don''t Stop Me Now', '00:03:29', 1),
('Beat It', '00:04:18', 2),
('Thriller', '00:05:57', 2),
('Billie Jean', '00:04:54', 2),
('Single Ladies', '00:03:13', 3),
('If I Were a Boy', '00:04:09', 3),
('Halo', '00:03:45', 3),
('Come Together', '00:04:20', 4),
('Here Comes the Sun', '00:03:05', 4),
('Something', '00:03:03', 4),
('Million Alyh Roz', '00:03:45', 5),
('Zhuravli', '00:04:40', 5),
('Arlekino', '00:04:35', 5);

INSERT INTO compilations (name, year) VALUES
('Best of Rock', 2022),
('Top Pop Hits', 2021),
('Hip-hop Classics', 2019),
('Jazz Standards', 2020),
('Electronic Anthems', 2018),
('80s Mixtape', 2017),
('Greatest Hits of 90s', 2016),
('Chillout Lounge', 2015);

INSERT INTO artist_genre (artist_id, genre_id) VALUES
(1, 1),
(2, 5),
(3, 2),
(4, 1),
(5, 2),
(6, 2),
(7, 3),
(8, 3);

INSERT INTO album_artist (album_id, artist_id) VALUES
(1, 4),
(2, 3),
(3, 1),
(4, 2),
(5, 6),
(6, 8),
(7, 5),
(8, 7);

INSERT INTO compilation_track (compilation_id, track_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(1, 9),
(2, 10),
(3, 11),
(4, 12),
(5, 13),
(6, 14),
(7, 15);