import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout Belanja'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali ke halaman sebelumnya
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Alamat Pengantaran',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Card(
              child: ListTile(
                leading: Icon(Icons.location_on, color: Colors.red),
                title: Text('Ancika Catleya'),
                subtitle:
                    Text('+62 889 1170 9263\nAsrama Gedung D, Kamar No. 101'),
                trailing: TextButton(
                  child: Text('Edit', style: TextStyle(color: Colors.red)),
                  onPressed: () {
                    // Handle edit address
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Ringkasan Pesanan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Image.asset('assets/twister.png'),
                  title: Text("Twister Mini's Snack Chocolate"),
                    subtitle: Text('Rp. 11.200'),
                    trailing: Text('x1'),
                  ),
                  ListTile(
                    leading: Image.asset('assets/potabee.png'),
                    title: Text('Potabee Seaweed Potato Chips'),
                    subtitle: Text('Rp. 11.200'),
                    trailing: Text('x2'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Total Pesanan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0), // Perbaikan dilakukan di sini
                child: Column(
                  children: <Widget>[
                    _buildTotalRow(
                        'Twister Mini’s Snack Chocolate', 'Rp. 11.200'),
                    _buildTotalRow(
                        'Potabee Seaweed Potato Chips', 'Rp. 22.400'),
                    _buildTotalRow('Subtotal Produk', 'Rp. 33.600',
                        isBold: true),
                    _buildTotalRow('Subtotal Pengiriman', 'Rp. 0'),
                    _buildTotalRow('Biaya Layanan', 'Rp. 0'),
                    Divider(),
                    _buildTotalRow('Total Pembayaran', 'Rp. 33.600',
                        isBold: true),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text('Pilih Metode Pembayaran',
                    style: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.pushNamed(context, '/metodePembayaran'); // Navigasi ke halaman Metode Pembayaran
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalRow(String title, String amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(amount,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
