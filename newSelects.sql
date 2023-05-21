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

SELECT DISTINCT a.name as artist_name
FROM artists a
LEFT JOIN albums al ON a.id = al.artist_id
WHERE al.year IS NULL OR al.year != 2020;


SELECT c.name as collection_name
FROM collections c
LEFT JOIN collection_track ct ON c.id = ct.collection_id
LEFT JOIN tracks t ON ct.track_id = t.id
LEFT JOIN albums a ON t.album_id = a.id
LEFT JOIN artists ar ON a.artist_id = ar.id
WHERE ar.name = 'Michael Djacson';


SELECT a.name as album_name
FROM albums a
LEFT JOIN artists ar ON a.artist_id = ar.id
LEFT JOIN artist_genre ag ON ar.id = ag.artist_id
GROUP BY a.name
HAVING COUNT(DISTINCT ag.genre_id) > 1;

SELECT t.name as track_name
FROM tracks t
LEFT JOIN collection_track ct ON t.id = ct.track_id
WHERE ct.collection_id IS NULL;

SELECT a.name as artist_name, t.name as track_name, t.duration as track_duration
FROM tracks t
LEFT JOIN albums al ON t.album_id = al.id
LEFT JOIN artists a ON al.artist_id = a.id
WHERE t.duration = (SELECT MIN(duration) FROM tracks);

SELECT a.name as album_name, COUNT(t.id) as number_of_tracks
FROM albums a
LEFT JOIN tracks t ON a.id = t.album_id
GROUP BY a.name
HAVING COUNT(t.id) = (SELECT MIN(number_of_tracks) FROM (SELECT COUNT(id) as number_of_tracks FROM tracks GROUP BY album_id) as temp_table);
