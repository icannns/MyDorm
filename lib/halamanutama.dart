import 'package:flutter/material.dart';
import 'tjmart.dart'; // Import halaman TjMart
import 'detailproduk.dart'; // Import halaman DetailProduk
import 'keranjangTjmart.dart'; // Import halaman KeranjangBelanja
import 'checkoutTjmart.dart'; // Import halaman Checkout
import 'metodepembayarantoken.dart'; // Import halaman LayarMetodePembayaran
import 'konfirmasipembayaran.dart'; // Import halaman LayarKonfirmasiPembayaran
import 'pembayaranberhasil.dart'; // Import halaman PembayaranBerhasilPage
import 'transaksi.dart'; // Import halaman PurchaseHistoryPage
import 'notifikasi.dart'; // Import halaman NotificationPage
import 'profile.dart'; // Import halaman ProfilePage
import 'scanbarcode.dart'; // Import halaman BarcodeScannerScreen
import 'token.dart'; // Import halaman TokenListrik
import 'keluhan.dart'; // Import halaman ChatScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      routes: {
        '/tjmart': (context) => TjMartPage(),
        '/detailProduk': (context) => DetailProdukPage(),
        '/keranjangBelanja': (context) => KeranjangBelanjaPage(),
        '/checkout': (context) => CheckoutPage(
              products: [],
            ),
        '/metodePembayaran': (context) => LayarMetodePembayaran(),
        '/konfirmasiPembayaran': (context) => LayarKonfirmasiPembayaran(),
        '/pembayaranBerhasil': (context) => PembayaranBerhasilPage(),
        '/transaksi': (context) => PurchaseHistoryPage(),
        '/notifikasi': (context) => NotificationPage(),
        '/profil': (context) => ProfilePage(),
        '/home': (context) => MainPage(), // Rute untuk halaman utama
        '/scanBarcode': (context) =>
            BarcodeScannerScreen(), // Rute untuk halaman scan barcode
        '/tokenListrik': (context) =>
            BeliTokenScreen(), // Rute untuk halaman token listrik
        '/keluhan': (context) => ChatScreen(), // Rute untuk halaman ChatScreen
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home'); // Navigasi ke halaman utama
        break;
      case 1:
        Navigator.pushNamed(
            context, '/transaksi'); // Navigasi ke halaman transaksi
        break;
      case 2:
        Navigator.pushNamed(
            context, '/notifikasi'); // Navigasi ke halaman notifikasi
        break;
      case 3:
        Navigator.pushNamed(context, '/profil'); // Navigasi ke halaman profil
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/trisna.jpeg'), // Replace with actual profile image URL
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trisna Yogantara',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Nomor Kamar: 123',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Image below profile
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                  'assets/news.png'), // Replace with actual image URL
            ),
            // Icon buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  IconButtonCard(
                    icon: Icons.qr_code_scanner,
                    label: 'Scan Barcode',
                    onTap: () {
                      Navigator.pushNamed(context,
                          '/scanBarcode'); // Navigasi ke halaman Scan Barcode
                    },
                  ),
                  IconButtonCard(
                    icon: Icons.shopping_cart,
                    label: 'TJ Mart',
                    onTap: () {
                      Navigator.pushNamed(
                          context, '/tjmart'); // Navigasi ke halaman TjMart
                    },
                  ),
                  IconButtonCard(
                    icon: Icons.flash_on,
                    label: 'Token Listrik',
                    onTap: () {
                      Navigator.pushNamed(context,
                          '/tokenListrik'); // Navigasi ke halaman Token Listrik
                    },
                  ),
                  IconButtonCard(
                    icon: Icons.chat,
                    label: 'Keluhan Chat/Call',
                    onTap: () {
                      Navigator.pushNamed(context,
                          '/keluhan'); // Navigasi ke halaman ChatScreen
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class IconButtonCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const IconButtonCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.red,
            ),
            SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
