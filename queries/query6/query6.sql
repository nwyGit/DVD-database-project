SELECT staff_id, rental_count
FROM (
    SELECT
        staff_id,
        COUNT(rental_id) AS rental_count,
        RANK() OVER (ORDER BY COUNT(rental_id) DESC) AS staff_rank
    FROM rental
    GROUP BY staff_id
) ranked_staff
WHERE staff_rank <= 5;

--The query lists the top 5 staff members who processed the most rentals.