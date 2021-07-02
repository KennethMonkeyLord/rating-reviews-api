import http from 'k6/http';

import {
  check,
  randomSeed,
  sleep,
} from 'k6';

export let options = {
  stages: [
    { duration: '20s', target: 300 },
    { duration: '60s', target: 1000 },
    { duration: '10s', target: 0 },
  ],


  thresholds: {
    http_req_failed: ['rate<0.01'],
    http_req_duration: ['p(95)<150', 'max < 250'],
  }
};

const localhost = 'http://localhost:3001';

randomSeed(0);

export default function () {
  const max = 1000000;

  let product_id = Math.floor(Math.random() * max) || 1;

  let res = http.get(`${localhost}/review/?product_id=${product_id}`, {
    tags: { name: 'GetReviewsForProducts' },
  });

  check(res, {
    'response code was 200': (res) => res.status === 200,
    'response duration < 250ms ': (res) => res.timings.duration < 250,
  });

  sleep(1);
}

