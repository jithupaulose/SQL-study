https://leetcode.com/problems/find-active-users/description/


# Write your MySQL query statement below

/**
Identify active users
An active user is a user that has made a second purchase within 7 days of any other of their purchases.

STEPS:

*/
WITH SortedUsers AS
(
    SELECT
    user_id, created_at,
    LAG(created_at) OVER(PARTITION BY user_id ORDER BY created_at) AS previous_date
    FROM Users
)
SELECT DISTINCT user_id
FROM SortedUsers
WHERE DATEDIFF(created_at, previous_date) <=7;
