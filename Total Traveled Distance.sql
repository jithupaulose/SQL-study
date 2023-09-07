https://leetcode.com/problems/total-traveled-distance/description/


# Write your MySQL query statement below
/**
TWO TABLES : Users and Rides

JOIN BY Users.user_id = Rides.user_id

To Find : 
    calculate the distance traveled by each user
    If any user doedsmt completed ride, return 0
    order by user_id ASC

PSEUDO CODE
    IFNULL(,0)
    SUM(distance) AS 'traveled distance'
    LEFT JOIN
    ON Users.user_id = Rides.user_id
    GROUP BY Users.user_id
    ORDER BY user_id ASC

*/
SELECT
   U.user_id,
   U.name,
    IFNULL(SUM(R.distance),0)AS 'traveled distance'
FROM Users U
LEFT JOIN Rides R
    ON U.user_id = R.user_id
GROUP BY U.user_id
ORDER BY U.user_id ASC
