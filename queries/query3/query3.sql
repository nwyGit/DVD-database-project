SELECT
   cate.name AS "Film Category",
   round(AVG(p.amount), 2) AS "Average Price of Film Rentals",
   round(SUM(p.amount), 2) AS "Total Price of Film Rentals" 
FROM
   rental r 
   JOIN
      customer c 
      ON r.customer_id = c.customer_id 
   JOIN
      payment p 
      ON p.customer_id = c.customer_id 
   JOIN
      inventory i 
      ON r.inventory_id = i.inventory_id 
   JOIN
      film f 
      ON i.film_id = f.film_id 
   JOIN
      film_category fc 
      ON f.film_id = fc.film_id 
   JOIN
      category cate 
      ON fc.category_id = cate.category_id 
GROUP BY
   "Film Category" 
ORDER BY
   "Total Price of Film Rentals" DESC,
   "Film Category" ASC

--The query retrieves film rental statistics, calculating the average and total prices for each film category. Results are grouped and ordered by total rental revenue.