https://leetcode.com/problems/immediate-food-delivery-iii/description/

# Write your MySQL query statement below

/**
Condition for immediate/scheduled
customer's preferred 
delivery date = order date, then immediate
delivery date <> order date, then scheduled

round(,2)
ORDER BY order_date ASC

STEPS:
GROUP BY order_date
Find each deliveryID --> immediate/scheduled

*/
WITH CTE AS
(
    SELECT
    delivery_id,
    customer_id,
    order_date,
    customer_pref_delivery_date,
    IF(order_date = customer_pref_delivery_date, 'immediate', 'scheduled') AS del
    FROM Delivery
)
select
order_date,ROUND(SUM(IF(del ='immediate',1,0))*100/COUNT(*),2) AS immediate_percentage
from CTE
GROUP BY 1
ORDER BY 1
