https://leetcode.com/problems/count-artist-occurrences-on-spotify-ranking-list/description/



SELECT
artist, 
COUNT(id) AS occurrences
FROM Spotify
GROUP BY artist
ORDER BY 2 DESC, 1 ASC
