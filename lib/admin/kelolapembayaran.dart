import 'package:flutter/material.dart';
import 'datamahasiswa.dart';
import 'kelolaproduk.dart';
import 'informasiasrama.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kelola Pembayaran',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KelolaPembayaranPage(),
      routes: {
        '/': (context) => AdminPage(),
        '/product': (context) => ProductPage(),
        '/kelola-pembayaran': (context) => KelolaPembayaranPage(),
        '/informasi-asrama': (context) => HomePage(),
      },
    );
  }
}

class KelolaPembayaranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text('Admin > Kelola Pembayaran'),
            ],
          ),
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
          bottom: TabBar(
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.red,
            tabs: [
              Tab(text: 'Pembayaran'),
              Tab(text: 'Pengiriman'),
            ],
          ),
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
                title: Text('Data Mahasiswa',
                    style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_bag, color: Colors.black),
                title: Text('Kelola Produk'),
                onTap: () {
                  Navigator.pushNamed(context, '/product');
                },
              ),
              ListTile(
                leading: Icon(Icons.payment, color: Colors.red),
                title: Text('Kelola Pembayaran',
                    style: TextStyle(color: Colors.red)),
                tileColor: Colors.red[50],
                onTap: () {},
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
        body: TabBarView(
          children: [
            PembayaranTab(),
            PengirimanTab(),
          ],
        ),
      ),
    );
  }
}

class PembayaranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search orders',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: DataTable(
              columns: [
                DataColumn(label: Text('Nomor')),
                DataColumn(label: Text('Id Pemesanan')),
                DataColumn(label: Text('Tanggal')),
                DataColumn(label: Text('Total')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Produk')),
                DataColumn(label: Text('Action')),
              ],
              rows: List<DataRow>.generate(
                8,
                (index) => DataRow(
                  cells: [
                    DataCell(Text('${index + 1}')),
                    DataCell(Text('123A')),
                    DataCell(Text('${20 - index} Mar, 2023')),
                    DataCell(Text('Rp. 75.000')),
                    DataCell(Text(index % 3 == 0
                        ? 'Berhasil'
                        : index % 3 == 1
                            ? 'Menunggu Pembayaran'
                            : 'Gagal')),
                    DataCell(Text('Produk ${index + 1}')),
                    DataCell(
                      PopupMenuButton<String>(
                        onSelected: (String result) {
                          // Handle action here
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'view',
                            child: Text('View'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                        ],
                        child: Icon(Icons.more_vert),
                      ),
                    ),
                  ],
                ),
              ),
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
    );
  }
}

class PengirimanTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search orders',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: DataTable(
              columns: [
                DataColumn(label: Text('Nomor')),
                DataColumn(label: Text('Id Pemesanan')),
                DataColumn(label: Text('Tanggal')),
                DataColumn(label: Text('Alamat')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Produk')),
                DataColumn(label: Text('Action')),
              ],
              rows: List<DataRow>.generate(
                8,
                (index) => DataRow(
                  cells: [
                    DataCell(Text('${index + 1}')),
                    DataCell(Text('123A')),
                    DataCell(Text('${20 - index} Mar, 2023')),
                    DataCell(Text('Nama, Nomor Hp, Gedung 5 Nomor 215')),
                    DataCell(Text(index % 3 == 0 ? 'Selesai' : 'Dalam Proses')),
                    DataCell(Text('Produk ${index + 1}')),
                    DataCell(
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: index % 3 == 0 ? Colors.grey : Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Terkirim',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
    );
  }
}
