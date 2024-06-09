import 'package:flutter/material.dart';

class LayarKonfirmasiPembayaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran'),
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
          children: [
            Text(
              'Total Bayar :',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Rp. 100.000',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(height: 8),
            Text(
              'No. Virtual Account',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '8891 4374 2873 2345',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.copy),
                  onPressed: () {
                    // Handle copy action
                  },
                ),
              ],
            ),
            Divider(height: 32, thickness: 1),
            Text(
              'Tata Cara Pembayaran',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildLangkahPembayaran(
                '1', 'Buka Aplikasi Dana dan Log in ke akun Anda'),
            _buildLangkahPembayaran('2', 'Klik Virtual Account Transfer'),
            _buildLangkahPembayaran('3', 'Pilih Merchant: Dana'),
            _buildLangkahPembayaran(
                '4', 'Masukkan No. VA 8891 lalu klik Selanjutnya'),
            _buildLangkahPembayaran('5',
                'Masukkan jumlah transfer yang diinginkan, pastikan jumlah yang dimasukkan sesuai dengan tagihan. Klik Selanjutnya'),
            _buildLangkahPembayaran('6',
                'Periksa informasi yang ada di layar, kemudian klik Konfirmasi dan Masukkan PIN'),
            _buildLangkahPembayaran('7',
                'Transaksi akan diproses di Aplikasi Dana. Setelah transaksi berhasil, silakan kembali ke Aplikasi MyDorm untuk cek status transaksi'),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pembayaranBerhasil'); // Navigasi ke halaman Pembayaran Berhasil
                },
                child: Text('Konfirmasi Pembayaran'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLangkahPembayaran(String nomor, String deskripsi) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.blue,
            child: Text(
              nomor,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              deskripsi,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
