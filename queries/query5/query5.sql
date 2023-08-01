SELECT
   actor_id AS "Actor ID",
   actor_name AS "Actor Name",
   film_count AS "Film COUNT" 
FROM
   (
      SELECT
         a.actor_id,
         concat(a.first_name, a.last_name) AS "actor_name",
         COUNT(f.film_id) AS film_count,
         RANK() OVER (
      ORDER BY
         COUNT(f.film_id) DESC) AS actor_rank 
      FROM
         actor a 
         LEFT JOIN
            film_actor fa 
            ON a.actor_id = fa.actor_id 
         LEFT JOIN
            film f 
            ON fa.film_id = f.film_id 
      GROUP BY
         a.actor_id,
         "actor_name" 
   )
   ranked_actors 
WHERE
   actor_rank <= 10 
ORDER BY
   actor_rank;

--The query find the top 10 actors who have appeared in the most films.