import 'package:flutter/material.dart';
import 'halamanutama.dart';
import 'transaksi.dart';
import 'profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationPage(),
      routes: {
        '/home': (context) => MainPage(),
        '/transaksi': (context) => PurchaseHistoryPage(),
        '/notifikasi': (context) => NotificationPage(),
        '/profil': (context) => ProfilePage(),
      },
    );
  }
}

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
        title: Text('Notifikasi'),
        backgroundColor: const Color.fromARGB(255, 242, 242, 242),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: 'Sudah Dibaca'),
            Tab(text: 'Belum Dibaca'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          NotificationList(),
          NotificationList(),
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

class NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // Hitungan Notifikasi
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.message, color: Colors.blue),
          title: Text('Admin Pengelola Layanan Asrama membalas pesanmu'),
          subtitle: Text('8m lalu'),
          onTap: () {},
        );
      },
    );
  }
}
