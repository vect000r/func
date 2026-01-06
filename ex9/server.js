const express = require('express');
const { Worker } = require('worker_threads');
const path = require('path');

const app = express();
app.use(express.json());

// ============================================
// 3.0 - Liczba pierwsza z Promise
// ============================================
function isPrimePromise(num) {
  return new Promise((resolve, reject) => {
    if (typeof num !== 'number' || num < 2) {
      return reject(new Error('Number must be >= 2'));
    }
    
    if (num === 2) return resolve(true);
    if (num % 2 === 0) return resolve(false);

    const sqrt = Math.sqrt(num);
    for (let i = 3; i <= sqrt; i += 2) {
      if (num % i === 0) {
        return resolve(false);
      }
    }
    resolve(true);
  });
}

app.post('/api/is-prime', async (req, res) => {
  try {
    const { number } = req.body;
    const result = await isPrimePromise(number);
    res.json({ number, isPrime: result });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});


process.on('SIGTERM', async () => {
  console.log('Closing...');
  process.exit(0);
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server's working on ${PORT}`);
});