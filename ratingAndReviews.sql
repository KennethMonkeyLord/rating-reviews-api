DROP DATABASE IF EXISTS ratingAndReviews;

CREATE DATABASE ratingAndReviews;

-- USE ratingAndReviews;

DROP TABLE IF EXISTS product, reviews, reviewPhotos, characteristics CASCADE;

CREATE TABLE product (
  product_id SERIAL PRIMARY KEY
);

-- ---
-- Table 'reviews'
--
-- ---

CREATE TABLE reviews (
  review_id int PRIMARY KEY generated always as identity,
  rating INT,
  summary VARCHAR(60) DEFAULT NULL,
  name VARCHAR(30) DEFAULT NULL,
  date VARCHAR(20) DEFAULT NULL,
  helpfullness INTEGER NULL DEFAULT NULL,
  productId INT references product(product_id),
  reported BOOLEAN DEFAULT false,
  body VARCHAR(1000) DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL
);

-- -- ---
-- -- Table 'reviewPhotos'
-- --
-- -- ---

CREATE TABLE reviewPhotos (
  photo_id int PRIMARY KEY generated always as identity,
  url VARCHAR(100) DEFAULT NULL,
  rev_id INT references reviews(review_id)
);

-- -- ---
-- -- Table 'characteristics'
-- --
-- -- ---

CREATE TABLE characteristics (
  char_id int PRIMARY KEY generated always as identity,
  size INTEGER DEFAULT NULL,
  fit INTEGER DEFAULT NULL,
  length INTEGER DEFAULT NULL,
  quality INTEGER DEFAULT NULL,
  comfort INTEGER DEFAULT NULL,
  reviewId INTEGER references reviews(review_id),
  productId INTEGER references product(product_id)
);

-- -- ---
-- -- Foreign Keys
-- -- ---

-- ALTER TABLE reviews ADD FOREIGN KEY (productId) REFERENCES product (id);
-- ALTER TABLE reviewPhotos ADD FOREIGN KEY (review_id) REFERENCES reviews (id);
-- ALTER TABLE characteristics ADD FOREIGN KEY (reviewId) REFERENCES reviews (id);
-- ALTER TABLE characteristics ADD FOREIGN KEY (productId) REFERENCES product (id);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE product ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE reviews ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE reviewPhotos ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE characteristics ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO product (id) VALUES
-- ('');
-- INSERT INTO reviews (id,rating,summary,name,date,photos,helpfullness,productId,reported,body,email) VALUES
-- ('','','','','','','','','','','');
-- INSERT INTO reviewPhotos (id,url,review_id) VALUES
-- ('','','');
-- INSERT INTO characteristics (id,size,fit,length,quality,comfort,reviewId,productId) VALUES
-- ('','','','','','','','');