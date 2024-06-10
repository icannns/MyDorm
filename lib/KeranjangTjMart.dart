import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/keranjang_model.dart';
import 'package:flutter_application_2/service/api_service_keranjang.dart';
import 'package:flutter_application_2/checkoutTjMart.dart';

class KeranjangBelanjaPage extends StatefulWidget {
  @override
  _KeranjangBelanjaPageState createState() => _KeranjangBelanjaPageState();
}

class _KeranjangBelanjaPageState extends State<KeranjangBelanjaPage> {
  final KeranjangApiService apiService = KeranjangApiService();
  List<Keranjang> products = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      List<Keranjang> fetchedProducts = await apiService.getKeranjang();
      setState(() {
        products = fetchedProducts;
      });
      print("Products fetched successfully: $products");
    } catch (e) {
      print('Failed to load products: $e');
    }
  }

  Future<void> _toggleSelection(int index) async {
    setState(() {
      products[index].selected = !products[index].selected;
    });
    await apiService.updateKeranjang(products[index].id, products[index]);
  }

  Future<void> _increaseQuantity(int index) async {
    setState(() {
      products[index].quantity++;
    });
    await apiService.updateKeranjang(products[index].id, products[index]);
  }

  Future<void> _decreaseQuantity(int index) async {
    if (products[index].quantity > 1) {
      setState(() {
        products[index].quantity--;
      });
      await apiService.updateKeranjang(products[index].id, products[index]);
    }
  }

  Future<void> _deleteProduct(int index) async {
    await apiService.deleteFromKeranjang(products[index].id);
    setState(() {
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang Belanja'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_outline),
            onPressed: () {
              // Handle bookmark action
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle shopping cart action
            },
          ),
        ],
      ),
      body: products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Checkbox(
                          value: products[index].selected,
                          onChanged: (bool? value) {
                            _toggleSelection(index);
                          },
                        ),
                        Image.asset(
                          products[index].image,
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                products[index].name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Rp. ${products[index].price}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                _decreaseQuantity(index);
                              },
                            ),
                            Text(
                              '${products[index].quantity}',
                              style: TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                _increaseQuantity(index);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _deleteProduct(index);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            List<Keranjang> selectedProducts =
                products.where((product) => product.selected).toList();
            print("Selected products: $selectedProducts");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckoutPage(products: selectedProducts),
              ),
            );
          },
          child: Text('Checkout'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
