WITH AvgFilmLengthByCategory AS (
    SELECT
        c.name,
        ROUND(AVG(length), 2) AS avg_film_length
    FROM
        film f
    INNER JOIN
        film_category fc ON fc.film_id = f.film_id
	INNER JOIN
        category c ON fc.category_id = c.category_id
    GROUP BY
        c.name
)
SELECT
    name as "Category Name",
    avg_film_length as "Average Film Length (min)"
FROM
    AvgFilmLengthByCategory;

--The query determines the average length of films in each category.