SELECT
   r.customer_id AS "Customer ID",
   CONCAT(c.first_name, c.last_name) AS "Customer Name",
   c.email AS "Customer Email",
   COUNT(r.customer_id) AS "Number of Rentals" 
FROM
   rental r 
   JOIN
      customer c 
      ON r.customer_id = c.customer_id 
GROUP BY
   "Customer ID",
   "Customer Name",
   "Customer Email"
ORDER BY
   COUNT(r.customer_id) DESC;

--The query retrieves rental statistics for customers, showing their ID, name, email, and the total number of rentals made, ordered by the highest rentals first.