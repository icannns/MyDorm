import 'package:flutter/material.dart';
import 'halamanutama.dart'; // Import halaman MainPage
import 'tjmart.dart'; // Import halaman TjMart
import 'detailproduk.dart'; // Import halaman DetailProduk
import 'keranjangTjmart.dart'; // Import halaman KeranjangBelanja
import 'checkoutTjmart.dart'; // Import halaman Checkout
import 'metodepembayarantoken.dart'; // Import halaman LayarMetodePembayaran
import 'konfirmasipembayaran.dart'; // Import halaman LayarKonfirmasiPembayaran
import 'pembayaranberhasil.dart'; // Import halaman PembayaranBerhasilPage
import 'transaksi.dart'; // Import halaman PurchaseHistoryPage
import 'notifikasi.dart'; // Import halaman NotificationPage
import 'profile.dart'; // Import halaman ProfilePage

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginPage(),
      routes: {
        '/main': (context) => MainPage(),
        '/tjmart': (context) => TjMartPage(),
        '/detailProduk': (context) => DetailProdukPage(),
        '/keranjangBelanja': (context) => KeranjangBelanjaPage(),
        '/checkout': (context) => CheckoutPage(products: [],),
        '/metodePembayaran': (context) => LayarMetodePembayaran(),
        '/konfirmasiPembayaran': (context) => LayarKonfirmasiPembayaran(),
        '/pembayaranBerhasil': (context) => PembayaranBerhasilPage(),
        '/transaksi': (context) => PurchaseHistoryPage(),
        '/notifikasi': (context) => NotificationPage(),
        '/profil': (context) => ProfilePage(),
        '/home': (context) =>
            MainPage(), // Pastikan rute untuk halaman utama ada
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 40.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  // Handle back button press
                },
              ),
            ),
            SizedBox(height: 40.0),
            // Login text
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Log In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: Text(
                'Masuk menggunakan akun dan password yang terdaftar pada IGracias',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 40.0),
            // Form
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username / Email',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Masukkan Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      hintText: 'Masukkan Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                      ),
                      Text('Ingat Saya'),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/main');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
