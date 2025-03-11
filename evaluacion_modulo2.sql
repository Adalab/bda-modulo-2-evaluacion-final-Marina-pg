USE sakila;

-- 1.Selecciona todos los nombres de las películas sin que aparezcan duplicados.
SELECT DISTINCT title
FROM film;

-- 2.Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
SELECT title
FROM film
WHERE rating = "PG-13";

/* 3.Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su
descripción.*/
SELECT title, description
FROM film
WHERE description LIKE "%amazing%";

-- 4.Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
SELECT title
FROM film
WHERE length > 120;

-- 5.Recupera los nombres de todos los actores.
 SELECT first_name
 FROM actor;
 
 -- 6.Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
 SELECT first_name, last_name
 FROM actor
 WHERE last_name LIKE "%Gibson%";
 
 -- 7.Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
 SELECT first_name
 FROM actor
 WHERE actor_id BETWEEN 10 AND 20;
 
 /* 8.Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su
clasificación.*/
SELECT title
FROM film
WHERE rating NOT IN ("R", "PG-13");

/* 9.Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la
clasificación junto con el recuento.*/
SELECT rating, COUNT(title) AS "Total películas por clasificación"
FROM film
GROUP BY rating;

/*10.Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su
nombre y apellido junto con la cantidad de películas alquiladas.*/
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS "Total películas alquiladas"
FROM  customer AS c
INNER JOIN rental AS r
USING (customer_id)
GROUP BY r.customer_id;

/*11.Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría
junto con el recuento de alquileres.*/
SELECT c.name, COUNT(r.inventory_id) AS 'Total alquileres'
FROM category AS c
LEFT JOIN film_category AS f
USING (category_id)
INNER JOIN inventory AS i
USING (film_id)
INNER JOIN rental AS r
USING (inventory_id)
GROUP BY c.name;

/*12.Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y
muestra la clasificación junto con el promedio de duración.*/
SELECT rating, ROUND(AVG(length), 0) AS 'Promedio duración'
FROM film
GROUP BY rating;

-- 13.Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
SELECT first_name, last_name
FROM actor
INNER JOIN film_actor
USING (actor_id)
INNER JOIN film
USING (film_id) 
WHERE film_id = (SELECT film_id
					FROM film
					WHERE title = "Indian Love");

-- 14.Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
SELECT title
FROM film
WHERE description LIKE '%dog%' OR description LIKE '%cat%';

-- 15.Hay algún actor o actriz que no aparezca en ninguna película en la tabla film_actor
SELECT first_name, last_name
FROM actor
WHERE actor_id NOT IN (SELECT actor_id
							FROM film_actor);
-- No hay ningún actor que no aparezca en ninguna película

-- 16.Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
SELECT title
FROM film
