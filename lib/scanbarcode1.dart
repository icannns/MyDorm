import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BarcodeScannerScreen(),
    );
  }
}

class BarcodeScannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Barcode'),
      ),
      backgroundColor: Colors.black, // Set the background color to black
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showPermissionDialog(context),
          child: Icon(Icons.camera),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showPermissionDialog(context),
        child: Icon(Icons.flash_on),
      ),
    );
  }

  void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.camera_alt, size: 50),
                SizedBox(height: 10),
                Text(
                  'Izinkan MyDorm untuk mengakses kamera?',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Divider(),
                TextButton(
                  onPressed: () {
                    // Add your code for always allowing access here
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Izinkan Selalu',
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                  ),
                ),
                Divider(),
                TextButton(
                  onPressed: () {
                    // Add your code for allowing access only when app is in use here
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Hanya saat aplikasi digunakan',
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                  ),
                ),
                Divider(),
                TextButton(
                  onPressed: () {
                    // Add your code for denying access here
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Jangan Izinkan',
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
