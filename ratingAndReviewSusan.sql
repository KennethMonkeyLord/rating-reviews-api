DROP DATABASE IF EXISTS ratingAndReviews;

CREATE DATABASE ratingAndReviews;

\c ratingandreviews;

DROP TABLE IF EXISTS review, reviewAlpha, review_photo, characteristic, review_characteristic CASCADE;

-- CREATE TABLE product (
--   id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
--   name VARCHAR(40),
--   chars INTEGER []
-- );

CREATE TABLE review (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  product_Id INT,
  rating INT,
  date BIGINT,
  summary VARCHAR(60),
  body VARCHAR(1000) DEFAULT NULL,
  recommend BOOLEAN DEFAULT false,
  reported BOOLEAN DEFAULT false,
  reviewer_name VARCHAR(60) DEFAULT NULL,
  reviewer_email VARCHAR(60) DEFAULT NULL,
  response VARCHAR(1000) DEFAULT NULL,
  helpfulness INTEGER DEFAULT 0,
  create_time_holder TIMESTAMP without TIME ZONE
);

-- CONSTRAINT chkbodylength CHECK (char_length(body) >= 50)

CREATE TABLE characteristic (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,  product_id INT,
  name VARCHAR(60)
);

CREATE TABLE review_characteristic (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  char_id INT REFERENCES characteristic(id),
  review_id INT REFERENCES review(id),
  value INT CHECK (value BETWEEN 0 AND 5)
);

CREATE TABLE review_photo(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  review_id INT REFERENCES review(id),
  url VARCHAR(2048)
);

CREATE INDEX review_product_id ON review(product_id, rating, reported);

CREATE INDEX photo_review_id ON review_photo(review_id);
--  COPY review(id, product_id, rating, date, summary, body, recommend, reported, reviewer_name, reviewer_email, response, helpfulness)
--  FROM '/Users/stevenlam/hackreactor/serverDatabaseCapstone/ratingAndReviewsAPI/dataCSVs/reviews.csv'
--  DELIMITER ','
--  CSV HEADER;

--  COPY review_photo(id,review_id, url)
--  FROM '/Users/stevenlam/hackreactor/serverDatabaseCapstone/ratingAndReviewsAPI/dataCSVs/reviews_photos.csv'
--  DELIMITER ','
--  CSV HEADER;

--  COPY characteristic(id, product_id, name)
--  FROM '/Users/stevenlam/hackreactor/serverDatabaseCapstone/ratingAndReviewsAPI/dataCSVs/characteristics.csv'
--  DELIMITER ','
--  CSV HEADER;

--  COPY review_characteristic(id, char_id, review_id, value)
--  FROM '/Users/stevenlam/hackreactor/serverDatabaseCapstone/ratingAndReviewsAPI/dataCSVs/characteristic_reviews.csv'
--  DELIMITER ','
--  CSV HEADER;

--  CREATE TABLE metaReviews (
--    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
--    recommended
--  )

--do the computation once and cache it on the server
--cardinality


-- My strengths are my patience towards challenges, both social and technical,

-- My favorite technologies

-- My approach to solving complex problems is to ask questions, and then ask questions about those questions, and continue that process until we start at a point that is feasible and well-routed to begin.


-- Bootcamp Grad

-- production level code
-- microserver
-- load testing load balance
-- doing projects and scaling that most companies do need
-- practical production oriented focus

