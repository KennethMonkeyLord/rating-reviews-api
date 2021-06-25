const pg = require('pg');
const { Pool } = pg;

const conString = 'postgres://stevenlam:password@localhost:5432/YourDatabase';

const pool = new Pool({
  conString,
});

const listReviews = (queryParams) => {
  // return a list of reviews to the server
  // determine correct query statement to put inside pool
  const queryString = 'this is';
  pool.query()
};
