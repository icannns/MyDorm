import 'package:flutter/material.dart';
import 'kelolaproduk.dart';
import 'kelolapembayaran.dart';
import 'datamahasiswa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        '/add_info': (context) => AddInfoPage(),
        '/product': (context) => ProductPage(),
        '/kelola-pembayaran': (context) => KelolaPembayaranPage(),
        '/informasi-asrama': (context) => HomePage(),
        '/data-mahasiswa': (context) => AdminPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Hapus'),
          content: Text('Apakah Anda yakin ingin menghapus informasi ini?'),
          actions: [
            TextButton(
              onPressed: () {
                // Handle delete action here
                Navigator.of(context).pop();
              },
              child: Text('Ya'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tidak'),
            ),
          ],
        );
      },
    );
  }

  void _showAlert(BuildContext context, String action) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih keperluan untuk mengelola informasi asrama'),
          content: Text('Anda memilih untuk $action.'),
          actions: [
            if (action == 'delete') ...[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _confirmDelete(context);
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
        title: Text('Admin > Informasi Asrama'),
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
              leading: Icon(Icons.person, color: Colors.black),
              title:
                  Text('Data Mahasiswa', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pushNamed(context, '/data-mahasiswa');
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag, color: Colors.black),
              title:
                  Text('Kelola Produk', style: TextStyle(color: Colors.black)),
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
              leading: Icon(Icons.info, color: Colors.red),
              title:
                  Text('Informasi Asrama', style: TextStyle(color: Colors.red)),
              tileColor: Colors.red[50],
              onTap: () {},
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
                    'Informasi Asrama',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/add_info');
                  },
                  child: Text('Masukkan Informasi Asrama'),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search information',
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
                  DataColumn(label: Text('Judul')),
                  DataColumn(label: Text('Deskripsi')),
                  DataColumn(label: Text('Gambar')),
                  DataColumn(label: Text('Action')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('1')),
                    DataCell(Text('Asrama Festival Food')),
                    DataCell(Text(
                        'Hallo dormitten! Bingung mau ngapain di hari Jumat dan Sabtu ini? Yuk, hadir di acara Asrama Food Festival yang akan dilaksanakan pada: \nTanggal: 17-19 Agustus 2023\nLokasi: Teras Pinang.')),
                    DataCell(Image.asset('assets/banner1.png',
                        width: 50, height: 50)),
                    DataCell(
                      PopupMenuButton<String>(
                        onSelected: (String result) {
                          _showAlert(context, result);
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
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
                    DataCell(Text('Asrama Festival Food')),
                    DataCell(Text(
                        'Hallo dormitten! Bingung mau ngapain di hari Jumat dan Sabtu ini? Yuk, hadir di acara Asrama Food Festival yang akan dilaksanakan pada: \nTanggal: 17-19 Agustus 2023\nLokasi: Teras Pinang.')),
                    DataCell(Image.asset('assets/banner1.png',
                        width: 50, height: 50)),
                    DataCell(
                      PopupMenuButton<String>(
                        onSelected: (String result) {
                          _showAlert(context, result);
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
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

class AddInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masukkan Informasi Asrama'),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            width: 600,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Masukan Informasi Asrama',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nomor',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Judul',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Deskripsi',
                  ),
                  maxLines: 3,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Gambar',
                    suffixIcon: Icon(Icons.image),
                  ),
                  readOnly: true,
                  onTap: () {
                    // Handle image selection
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle save information here
                  },
                  child: Text('Simpan Data'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
