import 'package:flutter/material.dart';

class DetailProdukPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TjMart'),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_outline),
            onPressed: () {
              // Handle bookmark action
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle shopping cart action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context); // Handle back action
                  },
                ),
                Text(
                  'Detail Produk',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: Image.asset(
                'assets/twister.png', // Menggunakan gambar lokal
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Twister Mini’s Snack Chocolate',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Rp. 18.200',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            SizedBox(height: 16),
            Text(
              'Deskripsi Produk',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Delfi Coklat wafer stik dengan krim coklat',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Komposisi :',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Terigu, Gula, Lemak nabati, susu bubuk, bubuk kakao, soya lesithin, Garam, Vanilli',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Takaran Per Kemasan :',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Sajian per kemasan : 2.5',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Takaran Per Serving :',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Energi total 100kkal, energi dari lemak 10kkal, lemak total 1.5g, lemak jenuh 0g, kolesterol 0mg, Sodium 125mg, karbohidrat total 23g, Dietary Fiber 2g, gula 14g, Protein 3g, kalsium 2%, Zat besi 2%',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        // Handle decrease quantity
                      },
                    ),
                    Text(
                      '2', // Ganti dengan jumlah yang sesuai
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        // Handle increase quantity
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/keranjangBelanja'); // Navigasi ke halaman KeranjangBelanja
                  },
                  child: Text('Tambah ke Keranjang'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
