const express = require('express');
const router = express.Router();

router.get('/');

router.get('/meta');

router.post();

router.put('/:review_id/helpful');

router.put('/:review_id/report');

module.exports = router;
