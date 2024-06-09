import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayarPemilihanNominal(),
    );
  }
}

class LayarPemilihanNominal extends StatefulWidget {
  @override
  _LayarPemilihanNominalState createState() => _LayarPemilihanNominalState();
}

class _LayarPemilihanNominalState extends State<LayarPemilihanNominal> {
  int _nominalTerpilih = 100000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beli Token'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nominal',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Masukkan Nominal yang akan kamu bayar untuk membeli token',
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              children: [
                _buildTombolNominal(100000),
                _buildTombolNominal(75000),
                _buildTombolNominal(50000),
                _buildTombolNominal(25000),
              ],
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                  print('Nominal Terpilih: $_nominalTerpilih');
                },
                child: Text('Lanjut'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTombolNominal(int nominal) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _nominalTerpilih = nominal;
        });
      },
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: _nominalTerpilih == nominal ? Colors.red : Colors.grey,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            nominal.toString(),
            style: TextStyle(
              color: _nominalTerpilih == nominal ? Colors.red : Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
