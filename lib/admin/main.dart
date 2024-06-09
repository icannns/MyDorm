import 'package:flutter/material.dart';
import 'datamahasiswa.dart';
import 'kelolaproduk.dart';
import 'kelolapembayaran.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => AdminPage(),
        '/kelola-produk': (context) => ProductPage(),
        '/kelola-pembayaran': (context) => KelolaPembayaranPage(),
      },
    );
  }
}
