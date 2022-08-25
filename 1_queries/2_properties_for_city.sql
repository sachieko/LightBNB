SELECT properties.id as property_id, title, cost_per_night, city, ROUND(AVG(rating),3) as average_rating FROM properties 
JOIN property_reviews ON property_id = properties.id
WHERE city ILIKE 'vancouver'
GROUP BY properties.id
HAVING ROUND(AVG(rating),3) >= 4
ORDER BY cost_per_night LIMIT 10;