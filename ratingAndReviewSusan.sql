DROP DATABASE IF EXISTS ratingAndReviews;

CREATE DATABASE ratingAndReviews;

DROP TABLE IF EXISTS product, reviews, reviewPhotos, characteristics CASCADE;

-- CREATE TABLE product (
--   id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
--   name VARCHAR(40),
--   chars INTEGER []
-- );

CREATE TABLE review (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  rating INT,
  summary VARCHAR(60) DEFAULT NULL,
  name VARCHAR(30) DEFAULT NULL,
  date VARCHAR(20) DEFAULT NULL,
  helpfullness INTEGER NULL DEFAULT NULL,
  recommend BOOLEAN DEFAULT false,
  reported BOOLEAN DEFAULT false,
  body VARCHAR(1000) DEFAULT NULL CHECK (body <> ''),
  email VARCHAR(50) DEFAULT NULL CHECK (email ),
  product_Id INT
);

-- CREATE TABLE characteristic (
--   id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
--   name VARCHAR(30),
-- );

CREATE TABLE review_characteristic (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  review_id INT REFERENCES review(id),
  char_name VARCHAR(30),
  -- char_id INT REFERENCES characteristic(id),
  value INT CHECK (value >= 0 && value < 5)
);

 CREATE TABLE reviewPhoto (
   id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
   url VARCHAR(50),
   review_id INT REFERENCES review(id)
 );

