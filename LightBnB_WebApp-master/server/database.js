/* eslint-disable camelcase */
const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'lightbnb',
  port: 5432
});
/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(email) {
  return pool.query(`
    SELECT * FROM users WHERE users.email ILIKE $1
    LIMIT 1
    ;
    `, [email])
    .then(res => res.rows[0])
    .catch(err => console.log(err.message));
};
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  return pool.query(`
    SELECT * FROM users WHERE users.id = $1
    LIMIT 1
    ;
    `, [id])
    .then(res => res.rows[0])
    .catch(err => console.log(err.message));
};
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser =  function(user) {
  return pool.query(`
    INSERT INTO users ( name, password, email ) 
    VALUES ($1, $2, $3)
    RETURNING *
    ;
    `, [user.name, user.password, user.email])
    .then(res => res.rows[0])
    .catch(err => console.log(err.message));
};
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  return pool.query(`
  SELECT reservations.id, properties.*, AVG(rating) as average_rating
  FROM reservations
  JOIN properties ON reservations.property_id = properties.id
  JOIN property_reviews ON property_reviews.property_id = properties.id
  WHERE reservations.guest_id = $1
  GROUP BY properties.id, reservations.id
  ORDER BY reservations.start_date
  LIMIT $2;
    `, [guest_id, limit])
    .then(res => res.rows)
    .catch(err => console.log(err.message));
};
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = function(options, limit = 20) {
  return pool.query(`
  SELECT properties.*, AVG(property_reviews.rating) as average_rating 
  FROM properties 
  JOIN property_reviews ON property_id = properties.id
  GROUP BY properties.id
  ORDER BY properties.id
  LIMIT $1;`, [limit])
    .then(res => res.rows)
    .catch(err => console.log(err.message));
};
exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  return pool.query(`
    INSERT INTO properties (title, description, number_of_bedrooms, number_of_bathrooms, parking_spaces,
    cost_per_night, thumbnail_photo_url, cover_photo_url, street, country, city, province, post_code)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13)
    RETURNING *;
    `, [property.title, property.description, property.number_of_bedrooms, property.number_of_bathrooms, property.parking_spaces, property.cost_per_night,
    property.thumbnail_photo_url, property.cover_photo_url, property.street, property.country, property.city, property.province, property.post_code])
    .then(res => res.rows[0])
    .catch(err => console.log(err.message));
};
exports.addProperty = addProperty;
