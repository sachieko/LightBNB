SELECT reservations.id, properties.title, reservations.start_date, properties.cost_per_night, AVG(rating) as average_rating
FROM reservations
JOIN properties ON reservations.property_id = properties.id
JOIN property_reviews ON property_reviews.property_id = properties.id
WHERE reservations.guest_id = 3
GROUP BY properties.id, reservations.id
ORDER BY reservations.start_date;