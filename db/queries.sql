-- view counts of all tickets sold by showing
SELECT films.title, screenings.screening, COUNT(*)
FROM films
INNER JOIN screenings
ON films.id = screenings.film_id
INNER JOIN tickets
ON screenings.id = tickets.screening_id
GROUP BY films.title, screenings.screening
ORDER BY count DESC;

-- view counts of all tikets sold for a specific movie
-- ordered desc to show the most popular show time


SELECT films.title, screenings.screening FROM films
INNER JOIN screenings ON films.id = screenings.film_id
INNER JOIN tickets ON tickets.screening_id = screenings.id
WHERE tickets.customer_id = 275
ORDER BY films.title;
