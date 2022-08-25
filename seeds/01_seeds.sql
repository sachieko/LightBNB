INSERT INTO users (name, email, password) 
VALUES ('Sachieko', 'birdsarentreal@madeup.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Andy', 'birdsarekindareal@madeup.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Johan', 'birdsmightbereal@madeup.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Gary', 'notscaredofghosts@madeup.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Alex', 'birdsareveryreal@madeup.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties (owner_id, title, thumbnail_photo_url, cover_photo_url, description, cost_per_night, parking_spaces,
number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code) 
VALUES (1, 'The Mirror House', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg',
'You can stare at who is responsible for all of your problems here, and loathe them.', 10, 1, 1, 1, 'Canada', '123 Fakestreet',
'Calgary', 'Alberta', 'T2T 0N0'),
(1, 'The Haunted House', 'www.houseofmirrors.com/img/thumb.png', 'www.typingurlsispain.com/img/cover.png',
'Spooky, very spooky! Lowest rating on the app because of the ghosts!', 20, 3, 3, 2, 'Canada', '123 Fakestreet',
'Calgary', 'Alberta', 'T2T 0N0'),
(2, 'Andy''s Palace', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg',
'Highest rated on the app because it''s not haunted or full of mirrors!', 65, 5, 4, 4, 'Canada', '123 Fakestreet',
'Calgary', 'Alberta', 'T2T 0N0'),
(5, 'The Bird House', 'https://tce-live2.s3.amazonaws.com/media/media/d94ee6d6-cf87-4001-9183-a07490901889.jpg', 'https://foter.com/photos/274/aviaries-for-sale-1.jpg',
'This coup is full of birds. Literal birds. There are falcons here. Watch out.', 100, 2, 1, 0, 'Canada', '123 Birdstreet',
'Calgary', 'Alberta', 'T2T 0N0');

INSERT INTO reservations (guest_id, property_id, start_date, end_date)
VALUES (3, 3, NOW(), '2022-10-14'),
(4, 2, NOW(), '2022-10-14'),
(2, 4, NOW(), '2022-10-14');

INSERT INTO property_reviews (message, rating, guest_id, reservation_id, property_id) VALUES
('I never want to go to this place again. The ghosts are nice but they don''t do dishes or anything.', 0, 4, 2, 2),
('This p(a)lace is amazing! Much better than the other places..', 5, 3, 1, 3),
('I just came to bird watch. It was nice but a falcon stole my hotdog.', 3, 2, 3, 4);