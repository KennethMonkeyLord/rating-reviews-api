const express = require('express');
const db = require('../models');

const router = express.Router();

router.get('/', (req, res) => {
  const { product_id, page, count, sort } = req.query;
  db.listReviews(product_id, page, count, sort)
    .then((data) => res.status(200).send(data))
    .catch((err) => res.status(500).send(err));
});

router.get('/meta', (req, res) => {
  const { product_id } = req.query;
  db.getMetaData(product_id)
    .then((data) => res.status(200).send(data.rows[0]))
    .catch((err) => {
      console.log(err)
    res.status(500).send(err)});
});

// router.post();

// router.put('/:review_id/helpful');

// router.put('/:review_id/report');

module.exports = router;
