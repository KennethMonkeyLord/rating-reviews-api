const { Pool } = require('pg');
const poolConfig = require('../config.js');

const pool = new Pool (
  poolConfig
);

const listReviews = (product_id, page = 1, count = 5, sort = 'newest') => {

  if (!product_id) {
    return new Error('No product_id specified')
  }

  const queryString = {
    // give the query a unique name
    name: 'fetch-user',
    text:
    `SELECT json_agg(
        json_build_object(
          'review_id', r.id,
              'rating', r.rating,
              'summary', r.summary,
              'recommend', r.recommend,
              'response', r.response,
              'body', r.body,
              'date', r.create_time_holder,
              'reviewer_name', r.reviewer_name,
              'helpfulness', r.helpfulness,
              'photos', (
                SELECT json_agg(
                  json_build_object(
                    'id', p.id,
                    'url', p.url
                  )
                )
                FROM review_photo p
                WHERE p.review_id=r.id
              )
        )
      ) AS results
    FROM (
      SELECT * FROM review
      WHERE product_id=$1 AND reported=false
      LIMIT $2
      ) AS r
    GROUP BY r.product_id
    `,
  }

  const values = [product_id, count]
      // FROM review r
    // WHERE r.product_id=${product_id} AND r.reported=false
    // GROUP BY r.product_id
    // LIMIT 1;
  // return a list of reviews to the server
  // determine correct query statement to put inside pool
  const reviewObject = {
    product: product_id,
    page,
    count,
  }
  return (
    pool.query(queryString, values)
      .then((data) => {
        reviewObject.results = data.rows[0].results
        return reviewObject
      })
  )

};

const getMetaData = (product_id) => {
  const queryString = {
    name: 'fetch-meta',
    text:
    `
    SELECT r.product_id, (
      SELECT json_build_object(
        '1', (SELECT count(rating) FROM review WHERE rating=1 AND product_id=$1),
        '2', (SELECT count(rating) FROM review WHERE rating=2 AND product_id=$1),
        '3', (SELECT count(rating) FROM review WHERE rating=3 AND product_id=$1),
        '4', (SELECT count(rating) FROM review WHERE rating=4 AND product_id=$1),
        '5', (SELECT count(rating) FROM review WHERE rating=5 AND product_id=$1)
      )
      ) AS ratings,
      (
        SELECT json_build_object(
          '0', (SELECT count(recommend) FROM review WHERE recommend=false AND product_id=$1),
          '1', (SELECT count(recommend) FROM review WHERE recommend=true AND product_id=$1)
        )
      ) AS recommended,
      (SELECT json_build_object(
        'size', 5
      )) AS characteristics
    FROM (
      SELECT * FROM review WHERE product_id=$1
    ) AS r
    `,
    //i need to query for how many reviews had 1-5 stars, store that in ratings
    //query how many reviews recommended and how many, stored as 0 or 1,
    //store characteristics, the name and id value
  }

  const values = [product_id]

  return (
    pool.query(queryString, values)
  )
}

const reportReview = (review_id) => {
  const queryString = {
    name: 'report-review',
    text:
    `
    UPDATE review SET reported=true WHERE id=$1
    `,
  }
  const values = [review_id]

  return (
    pool.query(queryString, values)
  )
}

const markHelpful = (review_id) => {
  const queryString = {
    name: 'helpful',
    text:
    `
    UPDATE review SET helpfulness=helpfulness+1 WHERE id=$1
    `,
  }

  const values = [review_id]

  return (
    pool.query(queryString, values)
  )
}

const addReview = (body) => {
  const queryString = {
    name: 'add-review',
    text:
    `
    INSERT INTO review(product_id, rating, date, summary, body, recommend, reviewer_name, reviewer_email, helpfulness, create_time_holder) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING id INTO r_id ;

    INSERT INTO review_photo(review_id, url) VALUES (r_id, $11)
    `,
  }
}
//time in epoch, 10 digits SELECT TRUNC(EXTRACT(EPOCH FROM now()));
//time in timestamp SELECT to_timestamp(TRUNC(extract(EPOCH from now())));
module.exports = {
  listReviews,
  getMetaData,
  reportReview,
  markHelpful,

};