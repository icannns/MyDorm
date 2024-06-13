import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/penghuni_asrama_model.dart';
import 'package:flutter_application_2/service/api_service_penghuni_asrama.dart';
import 'kelolaproduk.dart';
import 'kelolapembayaran.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AdminPage(),
      routes: {
        '/product': (context) => ProductPage(),
        '/kelola-pembayaran': (context) => KelolaPembayaranPage(),
        '/penghuni-asrama': (context) => PenghuniAsramaPage(),
      },
    );
  }
}

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin > Penghuni Asrama'),
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
              title: Text('Penghuni Asrama',
                  style: TextStyle(color: Colors.white)),
              tileColor: Colors.red,
              onTap: () {
                Navigator.pushNamed(context, '/penghuni-asrama');
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
      body: PenghuniAsramaPage(),
    );
  }
}

class PenghuniAsramaPage extends StatefulWidget {
  @override
  _PenghuniAsramaPageState createState() => _PenghuniAsramaPageState();
}

class _PenghuniAsramaPageState extends State<PenghuniAsramaPage> {
  final PenghuniAsramaApiService apiService = PenghuniAsramaApiService();
  List<PenghuniAsrama> penghuniList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPenghuniAsrama();
  }

  Future<void> _fetchPenghuniAsrama() async {
    try {
      List<PenghuniAsrama> fetchedPenghuni =
          await apiService.getPenghuniAsrama();
      setState(() {
        penghuniList = fetchedPenghuni;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Failed to load penghuni asrama: $e');
    }
  }

  Future<void> _deletePenghuni(int id) async {
    await apiService.deletePenghuniAsrama(id);
    _fetchPenghuniAsrama();
  }

  void _confirmDelete(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Hapus'),
          content: Text('Apakah Anda yakin ingin menghapus penghuni ini?'),
          actions: [
            TextButton(
              onPressed: () {
                _deletePenghuni(id);
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

  void _navigateToAddPenghuniPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPenghuniPage()),
    ).then((_) {
      _fetchPenghuniAsrama();
    });
  }

  void _navigateToEditPenghuniPage(PenghuniAsrama penghuni) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddPenghuniPage(
          isEdit: true,
          penghuniAsrama: penghuni,
        ),
      ),
    ).then((_) {
      _fetchPenghuniAsrama();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin > Penghuni Asrama'),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
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
                    'Penghuni Asrama',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: _navigateToAddPenghuniPage,
                  child: Text('Masukkan Data'),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search penghuni',
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
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : DataTable(
                      columns: [
                        DataColumn(label: Text('Nomor')),
                        DataColumn(label: Text('ID Penghuni Asrama')),
                        DataColumn(label: Text('Nama')),
                        DataColumn(label: Text('Gedung')),
                        DataColumn(label: Text('Lantai')),
                        DataColumn(label: Text('Nomor Kamar')),
                        DataColumn(label: Text('Nomor Kasur')),
                        DataColumn(label: Text('Nomor Token')),
                        DataColumn(label: Text('Action')),
                      ],
                      rows: penghuniList.map((penghuni) {
                        return DataRow(cells: [
                          DataCell(Text(penghuni.id.toString())),
                          DataCell(Text(penghuni.idPenghuniAsrama.toString())),
                          DataCell(Text(penghuni.nama)),
                          DataCell(Text(penghuni.gedung)),
                          DataCell(Text(penghuni.lantai.toString())),
                          DataCell(Text(penghuni.nomorKamar.toString())),
                          DataCell(Text(penghuni.nomorKasur.toString())),
                          DataCell(Text(penghuni.nomorToken)),
                          DataCell(
                            PopupMenuButton<String>(
                              onSelected: (String result) {
                                if (result == 'edit') {
                                  _navigateToEditPenghuniPage(penghuni);
                                } else if (result == 'delete') {
                                  _confirmDelete(context, penghuni.id!);
                                }
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
                        ]);
                      }).toList(),
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

class AddPenghuniPage extends StatefulWidget {
  final bool isEdit;
  final PenghuniAsrama? penghuniAsrama;

  AddPenghuniPage({this.isEdit = false, this.penghuniAsrama});

  @override
  _AddPenghuniPageState createState() => _AddPenghuniPageState();
}

class _AddPenghuniPageState extends State<AddPenghuniPage> {
  final _formKey = GlobalKey<FormState>();
  final _idPenghuniAsramaController = TextEditingController();
  final _namaController = TextEditingController();
  final _gedungController = TextEditingController();
  final _lantaiController = TextEditingController();
  final _nomorKamarController = TextEditingController();
  final _nomorKasurController = TextEditingController();
  final _nomorTokenController = TextEditingController();
  final PenghuniAsramaApiService apiService = PenghuniAsramaApiService();

  @override
  void initState() {
    super.initState();
    if (widget.isEdit && widget.penghuniAsrama != null) {
      _idPenghuniAsramaController.text =
          widget.penghuniAsrama!.idPenghuniAsrama.toString();
      _namaController.text = widget.penghuniAsrama!.nama;
      _gedungController.text = widget.penghuniAsrama!.gedung;
      _lantaiController.text = widget.penghuniAsrama!.lantai.toString();
      _nomorKamarController.text = widget.penghuniAsrama!.nomorKamar.toString();
      _nomorKasurController.text = widget.penghuniAsrama!.nomorKasur.toString();
      _nomorTokenController.text = widget.penghuniAsrama!.nomorToken;
    }
  }

  @override
  void dispose() {
    _idPenghuniAsramaController.dispose();
    _namaController.dispose();
    _gedungController.dispose();
    _lantaiController.dispose();
    _nomorKamarController.dispose();
    _nomorKasurController.dispose();
    _nomorTokenController.dispose();
    super.dispose();
  }

  Future<void> _savePenghuniAsrama() async {
    if (_formKey.currentState!.validate()) {
      final penghuniAsrama = PenghuniAsrama(
        id: widget.isEdit ? widget.penghuniAsrama!.id : 0,
        idPenghuniAsrama: int.parse(_idPenghuniAsramaController.text),
        nama: _namaController.text,
        gedung: _gedungController.text,
        lantai: int.parse(_lantaiController.text),
        nomorKamar: int.parse(_nomorKamarController.text),
        nomorKasur: int.parse(_nomorKasurController.text),
        nomorToken: _nomorTokenController.text,
      );

      try {
        if (widget.isEdit) {
          await apiService.updatePenghuniAsrama(
              penghuniAsrama.id!, penghuniAsrama);
        } else {
          await apiService.addPenghuniAsrama(penghuniAsrama);
        }
        Navigator.pop(context, true);
      } catch (e) {
        print('Failed to save penghuni asrama: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEdit
            ? 'Edit Penghuni Asrama'
            : 'Masukkan Penghuni Asrama'),
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.isEdit
                        ? 'Edit Penghuni Asrama'
                        : 'Masukkan Penghuni Asrama',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _idPenghuniAsramaController,
                    decoration: InputDecoration(
                      labelText: 'ID Penghuni Asrama',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter ID Penghuni Asrama';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _namaController,
                    decoration: InputDecoration(
                      labelText: 'Nama',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter nama';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _gedungController,
                    decoration: InputDecoration(
                      labelText: 'Gedung',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter gedung';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _lantaiController,
                    decoration: InputDecoration(
                      labelText: 'Lantai',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter lantai';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _nomorKamarController,
                    decoration: InputDecoration(
                      labelText: 'Nomor Kamar',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter nomor kamar';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _nomorKasurController,
                    decoration: InputDecoration(
                      labelText: 'Nomor Kasur',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter nomor kasur';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _nomorTokenController,
                    decoration: InputDecoration(
                      labelText: 'Nomor Token',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter nomor token';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _savePenghuniAsrama,
                    child: Text(widget.isEdit ? 'Update Data' : 'Simpan Data'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
