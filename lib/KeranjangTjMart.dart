import 'package:flutter/material.dart';

class KeranjangBelanjaPage extends StatefulWidget {
  @override
  _KeranjangBelanjaPageState createState() => _KeranjangBelanjaPageState();
}

class _KeranjangBelanjaPageState extends State<KeranjangBelanjaPage> {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Chitato Seaweed Potato Chips Lite',
      'price': '11.200',
      'image': 'assets/chitato.png',
      'quantity': 2,
      'selected': false,
    },
    {
      'name': 'Twister Mini\'s Snack Chocolate',
      'price': '11.200',
      'image': 'assets/twister.png',
      'quantity': 1,
      'selected': true,
    },
    {
      'name': 'Potabee Seaweed Potato Chips',
      'price': '11.200',
      'image': 'assets/potabee.png',
      'quantity': 2,
      'selected': true,
    },
    {
      'name': 'Beng Beng Share It Chocolate',
      'price': '11.200',
      'image': 'assets/bengbeng.png',
      'quantity': 2,
      'selected': false,
    },
    {
      'name': 'Oishii Suky - Suky Prawn Chips',
      'price': '11.200',
      'image': 'assets/oishii.png',
      'quantity': 2,
      'selected': false,
    },
  ];

  void _toggleSelection(int index) {
    setState(() {
      products[index]['selected'] = !products[index]['selected'];
    });
  }

  void _increaseQuantity(int index) {
    setState(() {
      products[index]['quantity']++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (products[index]['quantity'] > 1) {
        products[index]['quantity']--;
      }
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
            Navigator.pop(context); // Navigasi kembali ke halaman sebelumnya
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
      body: ListView.builder(
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
                    value: products[index]['selected'],
                    onChanged: (bool? value) {
                      _toggleSelection(index);
                    },
                  ),
                  Image.asset(
                    products[index]['image'],
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[index]['name'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Rp. ${products[index]['price']}',
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
                        '${products[index]['quantity']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          _increaseQuantity(index);
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
            Navigator.pushNamed(context, '/checkout'); // Navigasi ke halaman Checkout
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
