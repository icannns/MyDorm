const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const fs = require('fs');

const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(cors());

const dataFilePath = 'products.json';

// Fungsi untuk membaca data dari file JSON
const readData = () => {
  if (fs.existsSync(dataFilePath)) {
    const rawData = fs.readFileSync(dataFilePath);
    return JSON.parse(rawData);
  }
  return {
    products: { lastId: 0, items: [] }
  };
};

// Fungsi untuk menulis data ke file JSON
const writeData = (data) => {
  fs.writeFileSync(dataFilePath, JSON.stringify(data, null, 2));
};

// Endpoint untuk produk
app.get('/api/products', (req, res) => {
  const data = readData();
  res.json(data.products.items);
});

app.post('/api/products', (req, res) => {
  const data = readData();
  const newProduct = req.body;
  newProduct.id = data.products.lastId + 1;
  data.products.lastId = newProduct.id;
  data.products.items.push(newProduct);
  writeData(data);
  res.json(newProduct);
});

app.put('/api/products/:id', (req, res) => {
  const data = readData();
  const productIndex = data.products.items.findIndex(p => p.id === parseInt(req.params.id));
  if (productIndex !== -1) {
    data.products.items[productIndex] = { ...data.products.items[productIndex], ...req.body };
    writeData(data);
    res.json(data.products.items[productIndex]);
  } else {
    res.status(404).json({ message: 'Product not found' });
  }
});

app.delete('/api/products/:id', (req, res) => {
  const data = readData();
  data.products.items = data.products.items.filter(p => p.id !== parseInt(req.params.id));
  writeData(data);
  res.json({ message: 'Product deleted' });
});

app.listen(port, () => {
  console.log(`Server berjalan di port ${port}`);
});
