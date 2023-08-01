SELECT
   f.film_id AS "Film ID",
   f.title AS "Film Name",
   c.name AS "Film Category" 
FROM
   inventory i 
   JOIN
      film f 
      ON i.film_id = f.film_id 
   JOIN
      film_category fc 
      ON fc.film_id = f.film_id 
   JOIN
      category c 
      ON c.category_id = fc.category_id 
WHERE
   i.inventory_id NOT IN 
   (
      SELECT
         inventory_id 
      FROM
         rental
   )
   
--With this query, I am going to retrieve a list of films available in the inventory that have never been rented, using a NOT IN clause with a subquery to filter out films already present in the "rental" table's "inventory_id" column. The result set will include "Film ID," "Film Name," and "Film Category" columns to provide information about the films available for rental.