DROP DATABASE IF EXISTS ratingAndReviews;

CREATE DATABASE ratingAndReviews;

-- USE ratingAndReviews;

DROP TABLE IF EXISTS product, reviews, reviewPhotos, characteristics CASCADE;

CREATE TABLE product (
  product_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50)
  --new, each product has some characteristics
);

CREATE TABLE characteristics (
  char_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50),
  -- deleted --
  -- reviewId INTEGER REFERENCES reviews(review_id),
  productId INTEGER REFERENCES product(product_id)
);

CREATE TABLE product_characteristics (
  p_id REFERENCES product(product_id),
  c_id REFERENCES characteristics(char_id),
  PRIMARY KEY(p_id, n_id),

)

CREATE TABLE values (
  val_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  rating INT,
  char_id INT REFERENCES characteristics(char_id),
  review_id INT REFERENCES reviews(review_id)
);
-- ---
-- Table 'reviews'
--
-- ---

CREATE TABLE reviews (
  review_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  rating INT,
  summary VARCHAR(60) DEFAULT NULL,
  name VARCHAR(30) DEFAULT NULL,
  date VARCHAR(20) DEFAULT NULL,
  helpfullness INTEGER NULL DEFAULT NULL,
  reported BOOLEAN DEFAULT false,
  body VARCHAR(1000) DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL,
  productId INT REFERENCES product(product_id),
  --new
);
-- -- ---
-- -- Table 'reviewPhotos'
-- --
-- -- ---

CREATE TABLE reviewPhotos (
  photo_id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  url VARCHAR(100) DEFAULT NULL,
  rev_id INT REFERENCES reviews(review_id)
);

-- fix reviewPhotos
-- -- ---
-- -- Table 'characteristics'
-- --
-- -- ---


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