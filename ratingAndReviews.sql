DROP DATABASE IF EXISTS ratingAndReviews;

CREATE DATABASE ratingAndReviews;

USE ratingAndReviews;

DROP TABLE IF EXISTS product;

CREATE TABLE product (
  id SERIAL PRIMARY KEY
);

-- ---
-- Table 'reviews'
--
-- ---

DROP TABLE IF EXISTS reviews;

CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  rating INT,
  summary VARCHAR(60) DEFAULT NULL,
  name VARCHAR(30) DEFAULT NULL,
  date VARCHAR(20) DEFAULT NULL,
  helpfullness INTEGER NULL DEFAULT NULL,
  productId INT references product(id),
  reported BOOLEAN DEFAULT false,
  body VARCHAR(1000) DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL
);

-- -- ---
-- -- Table 'reviewPhotos'
-- --
-- -- ---

DROP TABLE IF EXISTS reviewPhotos;

CREATE TABLE reviewPhotos (
  id SERIAL PRIMARY KEY,
  url VARCHAR(100) DEFAULT NULL,
  review_id INT references reviews(id)
);

-- -- ---
-- -- Table 'characteristics'
-- --
-- -- ---

DROP TABLE IF EXISTS characteristics;

CREATE TABLE characteristics (
  id SERIAL PRIMARY KEY,
  size INTEGER DEFAULT NULL,
  fit INTEGER DEFAULT NULL,
  length INTEGER DEFAULT NULL,
  quality INTEGER DEFAULT NULL,
  comfort INTEGER DEFAULT NULL,
  reviewId INTEGER references reviews(id),
  productId INTEGER references product(id)
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