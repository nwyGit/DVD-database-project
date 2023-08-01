SELECT
   country.country AS "Country Name",
   cate.name AS "Film Category",
   COUNT(country.country) AS "Number of Rentals" 
FROM
   rental r 
   JOIN
      customer c 
      ON r.customer_id = c.customer_id 
   JOIN
      address a 
      ON a.address_id = c.address_id 
   JOIN
      city city 
      ON a.city_id = city.city_id 
   JOIN
      country country 
      ON city.country_id = country.country_id 
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
   "Country Name",
   "Film Category" 
ORDER BY
   COUNT(country.country) DESC,
   "Country Name" ASC,
   "Film Category" ASC

--The query retrieves rental statistics for films in different countries and categories. It groups the data by "Country Name" and "Film Category," counting rentals. Results are ordered by "Number of Rentals," "Country Name," and "Film Category."