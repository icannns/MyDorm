const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql2');

const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(cors());

// Konfigurasi koneksi ke database MySQL
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',  // Sesuaikan dengan user MySQL Anda
  password: '',  // Sesuaikan dengan password MySQL Anda
  database: 'mydormdb'
});

db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('Connected to MySQL Database.');
});

// Endpoint untuk produk
app.get('/api/products', (req, res) => {
  const sql = 'SELECT * FROM products';
  db.query(sql, (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json(results);
  });
});

app.post('/api/products', (req, res) => {
  const { name, price, stock, category, description } = req.body;
  const sql = 'INSERT INTO products (name, price, stock, category, description) VALUES (?, ?, ?, ?, ?)';
  db.query(sql, [name, price, stock, category, description], (err, result) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json({ id: result.insertId, name, price, stock, category, description });
  });
});

app.put('/api/products/:id', (req, res) => {
  const { id } = req.params;
  const { name, price, stock, category, description } = req.body;
  const sql = 'UPDATE products SET name = ?, price = ?, stock = ?, category = ?, description = ? WHERE id = ?';
  db.query(sql, [name, price, stock, category, description, id], (err) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json({ id, name, price, stock, category, description });
  });
});

app.delete('/api/products/:id', (req, res) => {
  const { id } = req.params;
  const sql = 'DELETE FROM products WHERE id = ?';
  db.query(sql, [id], (err) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json({ message: 'Product deleted' });
  });
});

app.listen(port, () => {
  console.log(`Server berjalan di port ${port}`);
});
