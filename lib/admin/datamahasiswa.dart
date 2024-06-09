import 'package:flutter/material.dart';
import 'kelolaproduk.dart';
import 'kelolapembayaran.dart';
import 'informasiasrama.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AdminPage(),
      routes: {
        '/product': (context) => ProductPage(),
        '/kelola-pembayaran': (context) => KelolaPembayaranPage(),
        '/informasi-asrama': (context) => HomePage(),
      },
    );
  }
}

class AdminPage extends StatelessWidget {
  void _showAlert(BuildContext context, String action) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih keperluan untuk mengelola produk'),
          content: Text('Anda memilih untuk $action.'),
          actions: [
            if (action == 'delete') ...[
              TextButton(
                onPressed: () {
                  // Handle delete action here
                  Navigator.of(context).pop();
                },
                child: Text('Delete'),
              ),
            ],
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin > Data Mahasiswa'),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('assets/mydormlogo.png'),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text('Data Mahasiswa', style: TextStyle(color: Colors.white)),
              tileColor: Colors.red,
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag, color: Colors.black),
              title: Text('Kelola Produk'),
              onTap: () {
                Navigator.pushNamed(context, '/product');
              },
            ),
            ListTile(
              leading: Icon(Icons.payment, color: Colors.black),
              title: Text('Kelola Pembayaran'),
              onTap: () {
                Navigator.pushNamed(context, '/kelola-pembayaran');
              },
            ),
            ListTile(
              leading: Icon(Icons.chat, color: Colors.black),
              title: Text('Keluhan Chat/Call'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.black),
              title: Text('Informasi Asrama'),
              onTap: () {
                Navigator.pushNamed(context, '/informasi-asrama');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Mahasiswa',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Masukkan Data Mahasiswa'),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search customers',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Nomor')),
                  DataColumn(label: Text('Nama')),
                  DataColumn(label: Text('NIM')),
                  DataColumn(label: Text('Fakultas')),
                  DataColumn(label: Text('Jurusan')),
                  DataColumn(label: Text('Gedung')),
                  DataColumn(label: Text('Nomor Kamar')),
                  DataColumn(label: Text('Action')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('1')),
                    DataCell(Text('Esther Howard')),
                    DataCell(Text('123123')),
                    DataCell(Text('Teknik Elektro')),
                    DataCell(Text('S1 Teknik Elektro')),
                    DataCell(Text('Lingian')),
                    DataCell(Text('999')),
                    DataCell(
                      PopupMenuButton<String>(
                        onSelected: (String result) {
                          _showAlert(context, result);
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'edit',
                            child: Text('Edit'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                        ],
                        child: Icon(Icons.more_vert),
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2')),
                    DataCell(Text('Wade Warren')),
                    DataCell(Text('123123')),
                    DataCell(Text('Rekayasa Industri')),
                    DataCell(Text('S1 Teknik Industri')),
                    DataCell(Text('Lingian')),
                    DataCell(Text('213')),
                    DataCell(
                      PopupMenuButton<String>(
                        onSelected: (String result) {
                          _showAlert(context, result);
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'edit',
                            child: Text('Edit'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                        ],
                        child: Icon(Icons.more_vert),
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('3')),
                    DataCell(Text('Brooklyn Simmons')),
                    DataCell(Text('123123')),
                    DataCell(Text('Ekonomi & Bisnis')),
                    DataCell(Text('S1 MBTI')),
                    DataCell(Text('Lingian')),
                    DataCell(Text('300')),
                    DataCell(
                      PopupMenuButton<String>(
                        onSelected: (String result) {
                          _showAlert(context, result);
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'edit',
                            child: Text('Edit'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                        ],
                        child: Icon(Icons.more_vert),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('1'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('2'),
                ),
                Text('...'),
                TextButton(
                  onPressed: () {},
                  child: Text('23'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('24'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
