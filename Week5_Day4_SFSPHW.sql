-- Homework Exercises


-- 1. Create a Stored Procedure that will insert a new film into the film table with the following arguments: title, description, release_year, language_id, rental_duration, rental_rate, length, replace_cost, rating
SELECT *
FROM film;

CREATE OR REPLACE PROCEDURE insert_film(
    IN title VARCHAR(255),
    IN description TEXT,
    IN release_year YEAR,
    IN language_id INT2,
    IN rental_duration INT2,
    IN rental_rate NUMERIC(4,2),
    IN length INT2,
    IN replacement_cost NUMERIC(5,2),
    IN rating PUBLIC.MPAA_RATING)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO film (
        title,
        description,
        release_year,
        language_id,
        rental_duration,
        rental_rate,
        length,
        replacement_cost,
        rating
    ) VALUES (
        title,
        description,
        release_year,
        language_id,
        rental_duration,
        rental_rate,
        length,
        replacement_cost,
        rating);
END;
$$;

CALL insert_film('Hazy Down', 'A man on a quest to get high', '2020', '1', '7', '4.99', '150', '14.99', 'R' );

SELECT *
FROM film WHERE title = 'Hazy Down'; -- Answer: It works, IF run it will SHOW the entire information displayed above

DELETE FROM film WHERE film_id = 1002; -- DELETE entries FROM queries IF there ARE MORE than one OF the same entry


-- 2. Create a Stored Function that will take in a category_id and return the number of films in that category
SELECT *
FROM film;

CREATE  OR REPLACE FUNCTION num_films_category(cat_id INT)
RETURNS INTEGER 
LANGUAGE plpgsql 
AS $$ 
	DECLARE num_films INTEGER;
BEGIN
	SELECT COUNT(*) INTO num_films
	FROM film_category 
	WHERE category_id = cat_id; 
	RETURN num_films;
END;
$$;

SELECT num_films_category(11); -- Answer: 56 films
SELECT num_films_category(14); -- Answer:61 films
SELECT num_films_category(7); -- Answer: 62 films

SELECT *
FROM category;


