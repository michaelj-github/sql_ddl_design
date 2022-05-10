DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL
);

CREATE TABLE locations (
  id SERIAL PRIMARY KEY,
  location_name TEXT NOT NULL,
  region_id INTEGER REFERENCES regions (id) ON DELETE CASCADE
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT,
  location_id INTEGER REFERENCES locations (id) ON DELETE SET NULL
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  post_title TEXT NOT NULL,
  post_text TEXT,
  post_user_id INTEGER REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  category_name TEXT NOT NULL
);

CREATE TABLE category_post (
  id SERIAL PRIMARY KEY,
  post_id INTEGER REFERENCES posts (id) ON DELETE CASCADE,
  category_id INTEGER REFERENCES categories (id) ON DELETE SET NULL
);

INSERT INTO regions (region_name)
VALUES 
('Northeast'), 
('Northwest'), 
('Southeast'), 
('Southwest');

INSERT INTO locations (location_name, region_id)
VALUES 
('Boston', 1), 
('Philadelphia', 1), 
('Seatle', 2), 
('Portland', 2), 
('Miami', 3), 
('Savanna', 3), 
('Phoenix', 4), 
('Tucson', 4);

INSERT INTO users (first_name, last_name, location_id)
VALUES 
('Michael', 'Ellis', 1),
('Christopher', 'Santana', 2),
('Jessica', 'Kramer', 3),
('Matthew', 'Conner', 4),
('Ashley', 'Levy', 5),
('Jennifer', 'Alvarez', 6),
('Joshua', 'Garcia', 7),
('Amanda', 'Mathis', 8),
('Daniel', 'Wilcox', 1),
('David', 'Beltran', 2),
('James', 'Lewis', 3),
('Robert', 'Huber', 4),
('John', 'Herrera', 5),
('Joseph', 'Rice', 6),
('Andrew', 'Nelson', 7),
('Ryan', 'Ferrell', 8);


INSERT INTO posts (post_title, post_text, post_user_id)
VALUES 
('Bacon ipsum dolor amet beef.', 'hock turducken brisket Frankfurter pork.', 1),
('ball tip drumstick ham ham.', 't-bone kielbasa cow sirloin leberkas.', 2),
('hock turducken brisket Frankfurter pork.', 'venison beef swine bresaola tri-tip.', 3),
('t-bone kielbasa cow sirloin leberkas.', 'pastrami drumstick corned beef Drumstick.', 4),
('venison beef swine bresaola tri-tip.', 'turducken pork chop chicken bacon.', 5),
('pastrami drumstick corned beef Drumstick.', 'Jowl cow tri-tip meatloaf beef.', 6),
('turducken pork chop chicken bacon.', 'hamburger prosciutto Venison leberkas ground.', 7),
('Jowl cow tri-tip meatloaf beef.', 'round hamburger chicken meatloaf sirloin.', 8),
('hamburger prosciutto Venison leberkas ground.', 'short ribs rump Kielbasa corned.', 9),
('round hamburger chicken meatloaf sirloin.', 'beef porchetta sirloin tail pork.', 10),
('short ribs rump Kielbasa corned.', 'loin Pork belly buffalo ham.', 11),
('beef porchetta sirloin tail pork.', 'hock tenderloin flank ribeye kevin.', 12),
('loin Pork belly buffalo ham.', 'porchetta meatloaf.', 13),
('hock tenderloin flank ribeye kevin.', 'Bacon ipsum dolor amet beef.', 14),
('porchetta meatloaf.', 'ball tip drumstick ham ham.', 15),
('Bacon ipsum dolor amet beef.', 'hock turducken brisket Frankfurter pork.', 16),
('ball tip drumstick ham ham.', 't-bone kielbasa cow sirloin leberkas.', 1),
('hock turducken brisket Frankfurter pork.', 'venison beef swine bresaola tri-tip.', 2),
('t-bone kielbasa cow sirloin leberkas.', 'pastrami drumstick corned beef Drumstick.', 3),
('venison beef swine bresaola tri-tip.', 'turducken pork chop chicken bacon.', 4),
('pastrami drumstick corned beef Drumstick.', 'Jowl cow tri-tip meatloaf beef.', 5),
('turducken pork chop chicken bacon.', 'hamburger prosciutto Venison leberkas ground.', 6),
('Jowl cow tri-tip meatloaf beef.', 'round hamburger chicken meatloaf sirloin.', 7),
('hamburger prosciutto Venison leberkas ground.', 'short ribs rump Kielbasa corned.', 8),
('round hamburger chicken meatloaf sirloin.', 'beef porchetta sirloin tail pork.', 9),
('short ribs rump Kielbasa corned.', 'loin Pork belly buffalo ham.', 10),
('beef porchetta sirloin tail pork.', 'hock tenderloin flank ribeye kevin.', 11),
('loin Pork belly buffalo ham.', 'porchetta meatloaf.', 12),
('hock tenderloin flank ribeye kevin.', 'Bacon ipsum dolor amet beef.', 13),
('porchetta meatloaf.', 'ball tip drumstick ham ham.', 14),
('Bacon ipsum dolor amet beef.', 'hock turducken brisket Frankfurter pork.', 15),
('ball tip drumstick ham ham.', 't-bone kielbasa cow sirloin leberkas.', 16);

INSERT INTO categories (category_name)
VALUES 
('Bacon'),
('Beef'),
('Ham'),
('Kielbasa'),
('Meatloaf'),
('Pork'),
('Proscuitto'),
('Sirloin'),
('Tenderloin'),
('Venison');


INSERT INTO category_post (post_id, category_id) 
VALUES 
('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('5', '5'),
('6', '6'),
('7', '7'),
('8', '8'),
('9', '9'),
('10', '10'),
('11', '1'),
('12', '2'),
('13', '3'),
('14', '4'),
('15', '5'),
('16', '6'),
('17', '7'),
('18', '8'),
('19', '9'),
('20', '10'),
('21', '1'),
('22', '2'),
('23', '3'),
('24', '4'),
('25', '5'),
('26', '6'),
('27', '7'),
('28', '8'),
('29', '9'),
('30', '10'),
('31', '1'),
('32', '2'),
('1', '3'),
('2', '4'),
('3', '5'),
('4', '6'),
('5', '7'),
('6', '8'),
('7', '9'),
('8', '10');



-- SELECT * FROM regions;

-- SELECT * FROM locations;
SELECT * FROM posts;
SELECT * FROM categories;


-- SELECT location_name, region_name FROM locations l
-- JOIN regions r
-- ON l.region_id = r.id;

-- SELECT * FROM users;

-- SELECT u.first_name, u.last_name, l.location_name, r.region_name FROM locations l
-- JOIN regions r
-- ON l.region_id = r.id
-- JOIN users u
-- ON u.location_id = l.id;

-- SELECT u.first_name, u.last_name, l.location_name, r.region_name, p.post_title, p.post_text FROM users u
-- JOIN locations l
-- ON u.location_id = l.id
-- JOIN regions r
-- ON l.region_id = r.id
-- JOIN posts p
-- ON p.post_user_id = u.id;

-- SELECT u.first_name, u.last_name, l.location_name, r.region_name, p.post_title, p.post_text, c.category_name, p.id, g.id, c.id FROM users u
-- SELECT u.first_name, u.last_name, l.location_name, r.region_name, p.post_title, p.post_text, c.category_name FROM users u
-- JOIN locations l
-- ON u.location_id = l.id
-- JOIN regions r
-- ON l.region_id = r.id
-- JOIN posts p
-- ON p.post_user_id = u.id
-- JOIN category_post g
-- ON g.post_id = p.id
-- JOIN categories c
-- ON g.category_id = c.id;

