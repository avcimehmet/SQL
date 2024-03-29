/* How many tracks does each album have? Your solution should include Album id and its number of tracks sorted from highest to lowest. */

SELECT AlbumId, COUNT(AlbumId) as "#_of_albums"
FROM tracks
GROUP BY AlbumId
ORDER BY COUNT(AlbumId) DESC;

/* Find the album title of the tracks. Your solution should include
track name and its album title. */

SELECT t.name as Track_Name, a.Title as Album_Title
FROM tracks t LEFT JOIN albums a
ON t.AlbumId = a.AlbumId;

/* Find the minimum duration of the track in each album. Your solution 
should include album id, album title and duration of the track sorted from 
highest to lowest. */

SELECT t.AlbumId, a.Title, MAX(t.Milliseconds) as max_duration
FROM tracks t LEFT JOIN albums a
ON t.AlbumId = a.AlbumId
GROUP BY a.Title
ORDER BY t.AlbumId
LIMIT 10;

/* Find the total duration of each album. Your solution should include 
album id, album title and its total duration sorted from highest to lowest. */

SELECT t.AlbumId, a.Title, round(avg(t.Milliseconds),3) as avg_duration
FROM tracks t LEFT JOIN albums a
ON t.AlbumId = a.AlbumId
GROUP BY a.Title
ORDER BY t.AlbumId
LIMIT 10;

/* Based on the previous question, find the albums whose total duration 
is higher than 70 minutes. Your solution should include album title 
and total duration. */

SELECT a.Title, sum(t.Milliseconds) as Total_duration
FROM tracks t LEFT JOIN albums a
ON t.AlbumId = a.AlbumId
GROUP BY a.Title
HAVING sum(t.Milliseconds) > 4200000
ORDER BY t.AlbumId;