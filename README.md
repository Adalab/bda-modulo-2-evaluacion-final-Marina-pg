# EVALUACIÓN MÓDULO 2:

La evaluación de este módulo consta de una serie de ejercicios para resolver con la base de datos Sakila, que imita a la base de datos de un videoclub y consta de varias tablas como películas, categorías, actores, actores en películas, clientes y alquileres, entre otras.

El ejercicio pide realizar consultas en estas tablas para encontrar películas con cierta categoría y duración, una palabra en la descripción o título, un apellido de un actor, etc., para ello he aplicado operadores de filtro, como “in” o “like”, o filtros sobre una columna, por ejemplo “WHERE length > 120”.

También se solicita conocer conocer el total de películas alquiladas por cada cliente o los nombres de los actores que actúan en más de 10 películas, para lo que he utilizado uniones de tablas (join) y funciones de agregación (count) y agrupación (group by).

Por útlimo, he realizado subqueries junto con uniones de tablas para conocer, por ejemplo, los nombres y apellidos de actores que no han actuado en películas de categoría "Horror". 
Y también he utilizado una subquery dentro de otra para resolver el último ejercicio que pide los títulos de películas de comedia con una duración superior a 180 minutos. En primer lugar es necesario filtrar en la tabla film los títulos que tienen una duración superior a 180 minutos, a continuación, para conocer las películas de categoría comedia es necesario filtrar por la columna name en la tabla category, y para unir ambas tablas es necesaria la tabla intermedia film_category. El código de esta subquery es el siguiente:
SELECT f.title
FROM film AS f
WHERE length > 180 AND film_id IN (SELECT film_id
									FROM film_category
                                    WHERE category_id IN (SELECT category_id
															FROM category
                                                            WHERE name = "Comedy"));
