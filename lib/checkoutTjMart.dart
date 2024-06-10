import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/keranjang_model.dart';

class CheckoutPage extends StatelessWidget {
  final List<Keranjang> products;

  CheckoutPage({required this.products}) {
    print("Received products: $products");
  }

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
                children: products.map((product) {
                  return ListTile(
                    leading: Image.asset(product.image),
                    title: Text(product.name),
                    subtitle: Text('Rp. ${_formatPrice(product.price)}'),
                    trailing: Text('x${product.quantity}'),
                  );
                }).toList(),
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
                    ...products.map((product) {
                      return _buildTotalRow(product.name,
                          'Rp. ${_formatPrice((double.parse(product.price) * product.quantity).toString())}');
                    }).toList(),
                    _buildTotalRow('Subtotal Produk',
                        'Rp. ${_formatPrice(_calculateSubtotal().toString())}',
                        isBold: true),
                    _buildTotalRow('Subtotal Pengiriman', 'Rp. 0'),
                    _buildTotalRow('Biaya Layanan', 'Rp. 0'),
                    Divider(),
                    _buildTotalRow('Total Pembayaran',
                        'Rp. ${_formatPrice(_calculateSubtotal().toString())}',
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
                  Navigator.pushNamed(context,
                      '/metodePembayaran'); // Navigasi ke halaman Metode Pembayaran
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatPrice(String price) {
    final doublePrice = double.parse(price);
    return doublePrice.toStringAsFixed(0) + '000';
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

  double _calculateSubtotal() {
    double subtotal = 0.0;
    for (var product in products) {
      subtotal += double.parse(product.price) * product.quantity;
    }
    return subtotal;
  }
}
