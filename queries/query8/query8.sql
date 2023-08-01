WITH CustomerRentalTotal AS (
    SELECT
        p.customer_id,
        SUM(p.amount) AS total_rental_amount
    FROM payment p
    GROUP BY p.customer_id
)
SELECT
    cr.customer_id,
    c.first_name AS "Customer First Name",
	c.last_name AS "Customer Last Name",
    cr.total_rental_amount AS "Total rental Amount"
FROM
    CustomerRentalTotal cr
JOIN
	customer c ON cr.customer_id = c.customer_id
ORDER BY
    cr.total_rental_amount DESC
LIMIT 5;

--The query identifies the top 5 customers who have made most value of rentals.