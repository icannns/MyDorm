const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql2');

const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(cors());

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'mydormdb'
});

db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('Connected to MySQL Database.');
});

// Endpoint for products
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

// Endpoint for informasi_asrama
app.get('/api/informasi_asrama', (req, res) => {
  const sql = 'SELECT * FROM informasi_asrama';
  db.query(sql, (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json(results);
  });
});

app.post('/api/informasi_asrama', (req, res) => {
  const { judul, deskripsi } = req.body;
  const sql = 'INSERT INTO informasi_asrama (judul, deskripsi) VALUES (?, ?)';
  db.query(sql, [judul, deskripsi], (err, result) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json({ id: result.insertId, judul, deskripsi });
  });
});

app.put('/api/informasi_asrama/:id', (req, res) => {
  const { id } = req.params;
  const { judul, deskripsi } = req.body;
  const sql = 'UPDATE informasi_asrama SET judul = ?, deskripsi = ? WHERE id = ?';
  db.query(sql, [judul, deskripsi, id], (err) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json({ id, judul, deskripsi });
  });
});

app.delete('/api/informasi_asrama/:id', (req, res) => {
  const { id } = req.params;
  const sql = 'DELETE FROM informasi_asrama WHERE id = ?';
  db.query(sql, [id], (err) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json({ message: 'Informasi asrama deleted' });
  });
});

// Endpoint for penghuni_asrama
app.get('/api/penghuni_asrama', (req, res) => {
  const sql = 'SELECT * FROM penghuni_asrama';
  db.query(sql, (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json(results);
  });
});

app.post('/api/penghuni_asrama', (req, res) => {
  const { idPenghuniAsrama, nama, gedung, lantai, nomorKamar, nomorKasur, nomorToken } = req.body;
  const sql = 'INSERT INTO penghuni_asrama (idPenghuniAsrama, nama, gedung, lantai, nomorKamar, nomorKasur, nomorToken) VALUES (?, ?, ?, ?, ?, ?, ?)';
  db.query(sql, [idPenghuniAsrama, nama, gedung, lantai, nomorKamar, nomorKasur, nomorToken], (err, result) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json({ id: result.insertId, idPenghuniAsrama, nama, gedung, lantai, nomorKamar, nomorKasur, nomorToken });
  });
});

app.put('/api/penghuni_asrama/:id', (req, res) => {
  const { id } = req.params;
  const { idPenghuniAsrama, nama, gedung, lantai, nomorKamar, nomorKasur, nomorToken } = req.body;
  const sql = 'UPDATE penghuni_asrama SET idPenghuniAsrama = ?, nama = ?, gedung = ?, lantai = ?, nomorKamar = ?, nomorKasur = ?, nomorToken = ? WHERE id = ?';
  db.query(sql, [idPenghuniAsrama, nama, gedung, lantai, nomorKamar, nomorKasur, nomorToken, id], (err) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json({ id, idPenghuniAsrama, nama, gedung, lantai, nomorKamar, nomorKasur, nomorToken });
  });
});

app.delete('/api/penghuni_asrama/:id', (req, res) => {
  const { id } = req.params;
  const sql = 'DELETE FROM penghuni_asrama WHERE id = ?';
  db.query(sql, [id], (err) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json({ message: 'Penghuni asrama deleted' });
  });
});

app.listen(port, () => {
  console.log(`Server berjalan di port ${port}`);
});
