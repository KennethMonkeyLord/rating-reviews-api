const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost/systemDesignCapstone', { useNewUrlParser: true, useUnifiedTopology: true });

const db = mongoose.connection;
db.on('error', console.error.bind(console, 'connection error:'));
db.once('open', () => {
  // we're connected!
});

const reviewSchema = new mongoose.Schema({
  productId: Number,
  reviewId: {
    type: Number, unique: true, required: true, dropDups: true,
  },
  reviewSummary: String,
  reviewBody: String,
  photos: [{ photoId: Number, photos: String }],
  helpfullness: Number,
  reported: {
    type: Boolean, default: false,
  },
  email: String,
  size: Number,
  fit: Number,
  quality: Number,
  comfort: Number,
  length: Number,
  date: Date,
  rating: Number,
});

const ReviewAndRating = mongoose.model('Review', reviewSchema);

// const Review = new ReviewAndRating(INSERT_DATA);

// let save = (data) => {
//   //save a repo to mongoDB database systemDesignCapstone
// }

// {Schema.Types.ObjectId, ref: ''}