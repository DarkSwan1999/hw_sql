SELECT g.name as genre_name, COUNT(ag.artist_id) as number_of_artists
FROM genres g
LEFT JOIN artist_genre ag ON g.id = ag.genre_id
LEFT JOIN artists a ON ag.artist_id = a.id
GROUP BY g.name;

SELECT COUNT(*) as number_of_tracks
FROM tracks t
LEFT JOIN albums a ON t.album_id = a.id
WHERE a.year BETWEEN 2019 AND 2020;

SELECT a.name as album_name, AVG(t.duration) as average_duration
FROM albums a
LEFT JOIN tracks t ON a.id = t.album_id
GROUP BY a.name;

SELECT a.name AS artist_name
FROM artists a
WHERE a.name NOT IN (
  SELECT a.name
  FROM artists a
  JOIN album_artist aa ON a.id = aa.artist_id
  JOIN albums al ON aa.album_id = al.id
  WHERE al.year = 2020
);

SELECT c.name as compilations_name
FROM compilations c
LEFT join compilation_track ct ON c.id = ct.compilation_id 
LEFT JOIN tracks t ON ct.track_id = t.id
LEFT JOIN albums a ON t.album_id = a.id
LEFT JOIN artists ar ON a.artist_id = ar.id
WHERE ar.name = 'Michael Djacson';


SELECT DISTINCT a.name AS album_name
FROM albums a
JOIN album_artist aa ON a.id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.id
JOIN artist_genre ag ON ar.id = ag.artist_id
GROUP BY a.name, ag.artist_id
HAVING COUNT(DISTINCT ag.genre_id) > 1;

SELECT t.name AS track_name
FROM tracks t
LEFT JOIN compilation_track ct ON t.id = ct.track_id
WHERE ct.compilation_id IS NULL;

SELECT a.name as artist_name, t.name as track_name, t.duration as track_duration
FROM tracks t
LEFT JOIN albums al ON t.album_id = al.id
LEFT JOIN artists a ON a."name"  = a.id
WHERE t.duration = (SELECT MIN(duration) FROM tracks);

SELECT a.name as album_name, COUNT(t.id) as number_of_tracks
FROM albums a
LEFT JOIN tracks t ON a.id = t.album_id
GROUP BY a.name
HAVING COUNT(t.id) = (SELECT MIN(number_of_tracks) FROM (SELECT COUNT(id) as number_of_tracks FROM tracks GROUP BY album_id) as temp_table);
