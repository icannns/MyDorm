import 'package:flutter/material.dart';

class LayarMetodePembayaran extends StatefulWidget {
  @override
  _LayarMetodePembayaranState createState() => _LayarMetodePembayaranState();
}

class _LayarMetodePembayaranState extends State<LayarMetodePembayaran> {
  String _metodePembayaranTerpilih = 'Dana Payment';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Metode Pembayaran',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Pilih metode pembayaran yang akan kamu gunakan'),
            SizedBox(height: 16),
            ExpansionTile(
              title: Text('E-Wallet'),
              children: [
                _buildMetodePembayaranTile(
                    'Dana Payment', 'Dicek Otomatis', 'assets/dana.jpeg'),
                _buildMetodePembayaranTile(
                    'LinkAja', 'Dicek Otomatis', 'assets/linkaja.jpeg'),
                _buildMetodePembayaranTile(
                    'OVO Payment', 'Dicek Otomatis', 'assets/ovo.jpeg'),
              ],
            ),
            ListTile(
              title: Text('Bank Transfer'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Handle bank transfer selection
              },
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/konfirmasiPembayaran'); // Navigasi ke halaman Konfirmasi Pembayaran
                },
                child: Text('Lanjut'),
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

  Widget _buildMetodePembayaranTile(
      String title, String subtitle, String assetPath) {
    return RadioListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: title,
      groupValue: _metodePembayaranTerpilih,
      onChanged: (String? value) {
        setState(() {
          _metodePembayaranTerpilih = value!;
        });
      },
      activeColor: Colors.blue,
      secondary: Image.asset(assetPath, width: 40),
    );
  }
}
