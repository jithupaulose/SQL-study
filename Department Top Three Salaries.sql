https://leetcode.com/problems/department-top-three-salaries/description/


/**

id is the primary key for this Table.
departmentId is the foriegn Key for the ID in the Dept Table.

Problem:
find the employees who are high earners in each of the departments.

for each Dept, find the top 3 unique salaries.

STEPS:

1. WITH CTE
2. DENSE_RANK() 

*/

With rank_cte AS
(

    SELECT
    Dept.name AS Department,
    Emp.name AS Employee,
    Emp.salary AS Salary,
    DENSE_RANK() OVER(PARTITION BY Dept.name ORDER BY Emp.salary DESC) AS rnk
    FROM Employee Emp
    JOIN Department Dept
    ON Emp.departmentId = Dept.id
)
SELECT 
    Department,
    Employee,
    Salary
 FROM rank_cte WHERE rnk <=3
