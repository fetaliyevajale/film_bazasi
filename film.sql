CREATE DATABASE film_bazasi;


CREATE TABLE users(
id INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(255)NOT NULL,
email VARCHAR (255) UNIQUE NOT NULL,
password VARCHAR (255) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE categories(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE films(
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
description TEXT,
release_date DATE,
category_id INT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (category_id) REFERENCES categories(id)
);


CREATE TABLE comments(
id INT PRIMARY KEY AUTO_INCREMENT,
film_id INT,
user_id INT,
comment TEXT NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (film_id) REFERENCES films(id),
FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE wishlist (
id INT PRIMARY KEY AUTO_INCREMENT,
film_id INT,
user_id INT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (film_id) REFERENCES films(id),
FOREIGN KEY (user_id) REFERENCES users(id)
);


INSERT INTO users (username,email,password) VALUES
('Jale','jale@gmail.com','900131AKTj'),
('Ruhi','Ruhi@gmail.com', '044Sx90044'),
('Asi','asi@gmail.com','asi67044A');


 INSERT INTO categories (name) VALUES
 ('Aksiyon'),
 ('Qorxu Gerilim'),
 ('Komedi'),
 ('Roman');


 INSERT INTO films(title, description, release_date, category_id) VALUES
  ('Action Movie', 'An exciting action film.', '2024-01-15', 1),
  ('The Exorcist','horror movie','1973-12-26',2),
  ('Comedy Movie', 'A funny comedy film.', '2024-02-20', 3),
  ('Harry Potter','fantasy movie','2002-11-16',4);


  INSERT INTO comments (film_id, user_id, comment) VALUES
  (1, 1, 'Əla film idi, yenidən izləməyə dəyər.'),
  (2, 2, 'qorxu filmlərini sevənlər üçün mükəmməl filmdir.'),
  (3, 3,  'Üzleri güldürəcək filmdi'),
  (4, 1,  'Ekranlara bağlayan ən maraqlı filmdi');


  INSERT INTO wishlist (film_id, user_id) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 1);


SELECT films.id, films.title, films.description, films.release_date, categories.name AS category
FROM films
JOIN categories ON films.category_id = categories.id;


SELECT c.comment, u.username, f.title AS film_title
FROM comments c
JOIN users u ON c.user_id = u.id
JOIN films f ON c.film_id = f.id;


SELECT w.user_id, f.title, f.release_date, f.description
FROM wishlist w
JOIN films f ON w.film_id = f.id;


SELECT c.comment, u.username
FROM comments c
JOIN users u ON c.user_id = u.id;



SELECT f.id, f.title, f.description, f.release_date, COUNT(c.id) AS comment_count
FROM films f
LEFT JOIN comments c ON f.id = c.film_id
GROUP BY f.id, f.title, f.description, f.release_date;


