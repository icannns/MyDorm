import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product_model.dart';
import 'package:flutter_application_2/service/api_service.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product> _products = [];
  ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  void _fetchProducts() async {
    try {
      final products = await _apiService.getProducts();
      setState(() {
        _products = products;
        _sortProductsById();
      });
    } catch (e) {
      print(e);
    }
  }

  void _sortProductsById() {
    _products.sort((a, b) => a.id!.compareTo(b.id!));
  }

  void _showAlert(BuildContext context, String action, Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih keperluan untuk mengelola produk'),
          content: Text('Anda memilih untuk $action.'),
          actions: [
            if (action == 'delete') ...[
              TextButton(
                onPressed: () async {
                  await _apiService.deleteProduct(product.id!);
                  _fetchProducts();
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

  void _navigateToAddProductPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddProductPage(onSubmit: (product) {
        _apiService.createProduct(product).then((_) => _fetchProducts());
      })),
    );
  }

  void _navigateToEditProductPage(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddProductPage(
        product: product,
        onSubmit: (updatedProduct) {
          _apiService.updateProduct(product.id!, updatedProduct).then((_) => _fetchProducts());
        },
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin > Kelola Produk'),
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
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag, color: Colors.red),
              title: Text('Kelola Produk', style: TextStyle(color: Colors.red)),
              tileColor: Colors.red[50],
              onTap: () {},
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
                    'Products',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: _navigateToAddProductPage,
                  child: Text('Masukkan Produk'),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search products',
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
                  DataColumn(label: Text('Harga')),
                  DataColumn(label: Text('Stok')),
                  DataColumn(label: Text('Kategori')),
                  DataColumn(label: Text('Deskripsi')),
                  DataColumn(label: Text('Action')),
                ],
                rows: _products.asMap().entries.map((entry) {
                  int index = entry.key;
                  Product product = entry.value;
                  return DataRow(cells: [
                    DataCell(Text((index + 1).toString())),  // Menampilkan nomor urut
                    DataCell(Text(product.name)),
                    DataCell(Text(product.price)),
                    DataCell(Text(product.stock)),
                    DataCell(Text(product.category)),
                    DataCell(Text(product.description)),
                    DataCell(
                      PopupMenuButton<String>(
                        onSelected: (String result) {
                          if (result == 'edit') {
                            _navigateToEditProductPage(product);
                          } else if (result == 'delete') {
                            _showAlert(context, result, product);
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

class AddProductPage extends StatefulWidget {
  final Product? product;
  final Function(Product) onSubmit;

  AddProductPage({this.product, required this.onSubmit});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      _nameController.text = widget.product!.name;
      _priceController.text = widget.product!.price;
      _stockController.text = widget.product!.stock;
      _categoryController.text = widget.product!.category;
      _descriptionController.text = widget.product!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? 'Masukkan Produk' : 'Edit Produk'),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama Produk',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan nama produk';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Harga',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan harga produk';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _stockController,
                decoration: InputDecoration(
                  labelText: 'Stok',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan stok produk';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(
                  labelText: 'Kategori',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan kategori produk';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Deskripsi',
                ),
                maxLines: 3,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan deskripsi produk';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newProduct = Product(
                      id: widget.product?.id,
                      name: _nameController.text,
                      price: _priceController.text,
                      stock: _stockController.text,
                      category: _categoryController.text,
                      description: _descriptionController.text,
                    );
                    widget.onSubmit(newProduct);
                    Navigator.pop(context);
                  }
                },
                child: Text('Save Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
