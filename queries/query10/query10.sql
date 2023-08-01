WITH CustomerRentals AS 
(
   SELECT
      r.customer_id,
      CONCAT(c.first_name, c.last_name) AS customer_name,
      COUNT(r.customer_id) AS "total_rentals" 
   FROM
      rental r 
      JOIN
         customer c 
         ON r.customer_id = c.customer_id 
   GROUP BY
      r.customer_id,
      customer_name 
   ORDER BY
      COUNT(r.customer_id) DESC
)
SELECT
   customer_id AS "Customer ID",
   customer_name AS "Customer Name",
   total_rentals AS "Total Rentals",
   CASE
      WHEN
         total_rentals < 20 
      THEN
         'Regular' 
      WHEN
         total_rentals >= 20 
         AND total_rentals <= 30 
      THEN
         'Frequent' 
      ELSE
         'VIP' 
   END
   AS "Customer Category" 
FROM
   CustomerRentals;

--The query categorizes customers by rental frequency.