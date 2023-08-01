SELECT
    title AS "Film Name",
    length AS "Film Length",
    CASE
        WHEN length <= 90 THEN 'Short'
        WHEN length > 90 AND length <= 120 THEN 'Medium'
        ELSE 'Long'
    END AS "Length Category"
FROM
    film;

--The query categorizes films by length.