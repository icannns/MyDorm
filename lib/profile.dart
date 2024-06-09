import 'package:flutter/material.dart';
import 'halamanutama.dart';
import 'transaksi.dart';
import 'notifikasi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
      routes: {
        '/home': (context) => MainPage(),
        '/transaksi': (context) => PurchaseHistoryPage(),
        '/notifikasi': (context) => NotificationPage(),
        '/profil': (context) => ProfilePage(),
      },
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3; // Assuming the profile tab is the fourth item

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home'); // Navigasi ke halaman utama
        break;
      case 1:
        Navigator.pushNamed(context, '/transaksi'); // Navigasi ke halaman transaksi
        break;
      case 2:
        Navigator.pushNamed(context, '/notifikasi'); // Navigasi ke halaman notifikasi
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
        title: Text('Profil Mahasiswa'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://your-image-url.com'),
          ),
          SizedBox(height: 10),
          Text('Ancika Catleya',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('Gedung D No. 203',
              style: TextStyle(fontSize: 16, color: Colors.grey)),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Riwayat Scanning'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text('Riwayat Panggilan'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Keluar'),
            onTap: () {},
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
