import 'package:flutter/material.dart';
import 'halamanutama.dart';
import 'profile.dart';
import 'notifikasi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PurchaseHistoryPage(),
      routes: {
        '/home': (context) => MainPage(),
        '/transaksi': (context) => PurchaseHistoryPage(),
        '/notifikasi': (context) => NotificationPage(),
        '/profil': (context) => ProfilePage(),
      },
    );
  }
}

class PurchaseHistoryPage extends StatefulWidget {
  @override
  _PurchaseHistoryPageState createState() => _PurchaseHistoryPageState();
}

class _PurchaseHistoryPageState extends State<PurchaseHistoryPage> {
  int _selectedIndex = 1; // Assuming the transaction tab is the second item

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
        title: Text('Riwayat Pembelian'),
        backgroundColor:
            Colors.grey[200], // Adjust the color to match the screenshot
        elevation: 0, // No shadow
      ),
      body: ListView(
        children: <Widget>[
          PurchaseItem(
            icon: Icons.shopping_cart,
            title: 'Tmart Online',
            subtitle: 'Lihat daftar riwayat Belanja',
          ),
          PurchaseItem(
            icon: Icons.flash_on,
            title: 'Pembelian Token',
            subtitle: 'Lihat daftar riwayat Transaksi',
          ),
        ],
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

class PurchaseItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  PurchaseItem(
      {required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 30),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Handle the tap event for each item
      },
    );
  }
}
