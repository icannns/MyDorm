import 'package:flutter/material.dart';
import 'kelolaproduk.dart';
import 'kelolapembayaran.dart';
import 'datamahasiswa.dart';
import 'package:flutter_application_2/models/informasi_asrama_model.dart';
import 'package:flutter_application_2/service/api_service_informasi_asrama.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final InformasiAsramaApiService apiService = InformasiAsramaApiService();
  List<InformasiAsrama> informasiList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchInformasiAsrama();
  }

  Future<void> _fetchInformasiAsrama() async {
    try {
      List<InformasiAsrama> fetchedInformasi = await apiService.getInformasiAsrama();
      setState(() {
        informasiList = fetchedInformasi;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Failed to load informasi asrama: $e');
    }
  }

  Future<void> _deleteInformasi(int id) async {
    await apiService.deleteInformasiAsrama(id);
    _fetchInformasiAsrama();
  }

  void _confirmDelete(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Hapus'),
          content: Text('Apakah Anda yakin ingin menghapus informasi ini?'),
          actions: [
            TextButton(
              onPressed: () {
                _deleteInformasi(id);
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
              title: Text('Data Mahasiswa', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pushNamed(context, '/data-mahasiswa');
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag, color: Colors.black),
              title: Text('Kelola Produk', style: TextStyle(color: Colors.black)),
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
              title: Text('Informasi Asrama', style: TextStyle(color: Colors.red)),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddInfoPage()),
                    ).then((_) {
                      _fetchInformasiAsrama();
                    });
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
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : DataTable(
                      columns: [
                        DataColumn(label: Text('Nomor')),
                        DataColumn(label: Text('Judul')),
                        DataColumn(label: Text('Deskripsi')),
                        DataColumn(label: Text('Gambar')),
                        DataColumn(label: Text('Action')),
                      ],
                      rows: informasiList.map((informasi) {
                        return DataRow(cells: [
                          DataCell(Text(informasi.id.toString())),
                          DataCell(Text(informasi.judul)),
                          DataCell(Text(informasi.deskripsi)),
                          DataCell(Image.asset(informasi.gambar, width: 50, height: 50)),
                          DataCell(
                            PopupMenuButton<String>(
                              onSelected: (String result) {
                                if (result == 'edit') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddInfoPage(
                                        isEdit: true,
                                        informasiAsrama: informasi,
                                      ),
                                    ),
                                  ).then((_) {
                                    _fetchInformasiAsrama();
                                  });
                                } else if (result == 'delete') {
                                  _confirmDelete(context, informasi.id);
                                }
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

class AddInfoPage extends StatefulWidget {
  final bool isEdit;
  final InformasiAsrama? informasiAsrama;

  AddInfoPage({this.isEdit = false, this.informasiAsrama});

  @override
  _AddInfoPageState createState() => _AddInfoPageState();
}

class _AddInfoPageState extends State<AddInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final _judulController = TextEditingController();
  final _deskripsiController = TextEditingController();
  final InformasiAsramaApiService apiService = InformasiAsramaApiService();
  File? _image;

  @override
  void initState() {
    super.initState();
    if (widget.isEdit && widget.informasiAsrama != null) {
      _judulController.text = widget.informasiAsrama!.judul;
      _deskripsiController.text = widget.informasiAsrama!.deskripsi;
      _image = File(widget.informasiAsrama!.gambar);
    }
  }

  @override
  void dispose() {
    _judulController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File? compressedFile = await _compressImage(File(pickedFile.path));
      setState(() {
        _image = compressedFile;
      });
    }
  }

  Future<File?> _compressImage(File file) async {
    final dir = await getTemporaryDirectory();
    final targetPath = "${dir.absolute.path}/temp.jpg";
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 85,
    );
    return result;
  }

  Future<void> _saveInformasiAsrama() async {
    if (_formKey.currentState!.validate()) {
      final informasiAsrama = InformasiAsrama(
        id: widget.isEdit ? widget.informasiAsrama!.id : 0,
        judul: _judulController.text,
        deskripsi: _deskripsiController.text,
        gambar: _image?.path ?? '',
      );

      try {
        if (widget.isEdit) {
          await apiService.updateInformasiAsrama(informasiAsrama.id, informasiAsrama);
        } else {
          await apiService.addInformasiAsrama(informasiAsrama);
        }
        Navigator.pop(context, true);
      } catch (e) {
        print('Failed to save informasi asrama: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEdit ? 'Edit Informasi Asrama' : 'Masukkan Informasi Asrama'),
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
                    widget.isEdit ? 'Edit Informasi Asrama' : 'Masukan Informasi Asrama',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _judulController,
                    decoration: InputDecoration(
                      labelText: 'Judul',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter judul';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _deskripsiController,
                    decoration: InputDecoration(
                      labelText: 'Deskripsi',
                    ),
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter deskripsi';
                      }
                      return null;
                    },
                  ),
                  TextButton(
                    onPressed: _pickImage,
                    child: Text('Pilih Gambar'),
                  ),
                  if (_image != null) ...[
                    Image.file(_image!, width: 100, height: 100),
                  ],
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _saveInformasiAsrama,
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
