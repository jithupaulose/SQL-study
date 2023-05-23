https://leetcode.com/problems/bikes-last-time-used/description/

SELECT
bike_number,
MAX(end_time) AS end_time
FROM Bikes
GROUP BY bike_number
ORDER BY 2 DESC
