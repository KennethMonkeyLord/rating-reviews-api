const express = require('express');
const path = require('path');
const app = express();
const reviews = require('./controllers/reviews.js');


const PORT = 3001;

app.use('/reviews', reviews);

app.listen(PORT, () => {
  console.log(`App listening at http://localhost:${PORT}`);
});
