----1----
SELECT first_name AS manager_first_name ,last_name AS manager_last_name,
address.address,address.district ,city.city,country.country
FROM staff INNER JOIN address 
ON staff.address_id= address.address_id
INNER JOIN city ON address.city_id=city.city_id
INNER JOIN country ON city.country_id=country.country_id;
----2----
SELECT store_id,inventory_id,film.title,film.rating,film.rental_rate,film.replacement_cost FROM inventory INNER JOIN film ON
inventory.film_id =film.film_id;
----3----
SELECT store_id,film.rating
FROM inventory INNER JOIN film ON
inventory.film_id =film.film_id;
-----4----
SELECT inventory.store_id ,film.replacement_cost,category.name AS category,film.title
FROM inventory INNER JOIN film
ON inventory.film_id=film.film_id INNER JOIN film_category 
ON film.film_id=film_category.film_id INNER JOIN category 
ON film_category.category_id=category.category_id;
-----5----
SELECT first_name,last_name,store_id,active,address.address,city.city,country.country
FROM customer
INNER JOIN address ON customer.address_id=address.address_id
INNER JOIN city ON address.city_id=city.city_id
INNER JOIN country ON city.country_id=country.country_id;
----6----
SELECT first_name,last_name,payment.rental_id FROM customer 
INNER JOIN payment ON customer.customer_id= payment.customer_id
GROUP BY payment.rental_id;


