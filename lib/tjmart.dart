import 'package:flutter/material.dart';
// ignore: unused_import
import 'detailproduk.dart'; // Import halaman DetailProduk



class TjMartPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Chitato Seaweed Potato Chips Lite',
      'price': '20.300',
      'image': 'assets/chitato.png'
    },
    {
      'name': 'Twister Mini\'s Snack Chocolate',
      'price': '18.200',
      'image': 'assets/twister.png'
    },
    {
      'name': 'Beng Beng Share It Chocolate',
      'price': '20.300',
      'image': 'assets/bengbeng.png'
    },
    {
      'name': 'Oishii Suky - Suky Prawn Chips',
      'price': '18.200',
      'image': 'assets/oishii.png'
    },
    {
      'name': 'Lays Cheese Potato Chips Big',
      'price': '20.300',
      'image': 'assets/potabee.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tmart Online'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (products[index]['name'] == 'Twister Mini\'s Snack Chocolate') {
                Navigator.pushNamed(context, '/detailProduk');
              }
            },
            child: Card(
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(products[index]['image'], fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(products[index]['name'],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Rp ' + products[index]['price']),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}