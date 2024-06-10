import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatPage(),
      routes: {
        '/product': (context) => ProductPage(),
        '/kelola-pembayaran': (context) => KelolaPembayaranPage(),
        '/informasi-asrama': (context) => HomePage(),
      },
    );
  }
}

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keluhan Chat/Call'),
        backgroundColor: Colors.red,
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
              title: Text('Data Mahasiswa'),
              onTap: () {},
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
              leading: Icon(Icons.chat, color: Colors.red),
              title: Text('Keluhan Chat/Call'),
              tileColor: Colors.red[100],
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
      body: Row(
        children: [
          // Chat List
          Expanded(
            flex: 2,
            child: ListView(
              children: [
                ListTile(
                  leading: CircleAvatar(child: Text('A')),
                  title: Text('Annette Black'),
                  subtitle: Text('Hey, did you talk to her?'),
                  trailing: Text('2m ago'),
                  onTap: () {},
                ),
                ListTile(
                  leading: CircleAvatar(child: Text('K')),
                  title: Text('Kylie Jenner'),
                  subtitle: Text('Hey, did you talk to her?'),
                  trailing: Text('2m ago'),
                  onTap: () {},
                ),
                ListTile(
                  leading: CircleAvatar(child: Text('C')),
                  title: Text('Cameron Williamson'),
                  subtitle: Text('Ok, Cya.'),
                  trailing: Text('35m ago'),
                  onTap: () {},
                ),
                ListTile(
                  leading: CircleAvatar(child: Text('J')),
                  title: Text('Jane Cooper'),
                  subtitle: Text('Thanks, I\'ll call you there.'),
                  trailing: Text('1d ago'),
                  onTap: () {},
                ),
                ListTile(
                  leading: CircleAvatar(child: Text('B')),
                  title: Text('Brennda Smily'),
                  subtitle: Text('Sent a picture'),
                  trailing: Text('1d ago'),
                  onTap: () {},
                ),
                ListTile(
                  leading: CircleAvatar(child: Text('J')),
                  title: Text('Jacob Jones'),
                  subtitle: Text('Miss a call'),
                  trailing: Text('1d ago'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          // Chat Area
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(10.0),
                    children: [
                      Text('Annette Black', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      ChatBubble(text: 'Halo Min', isAdmin: false),
                      ChatBubble(text: 'Saya butuh bantuan min', isAdmin: false),
                      ChatBubble(text: 'Halo, Ada yang bisa dibantu dik?', isAdmin: true),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Ketik pesan disini...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isAdmin;

  ChatBubble({required this.text, this.isAdmin = false});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isAdmin ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          color: isAdmin ? Colors.grey[300] : Colors.blue[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text),
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelola Produk'),
      ),
      body: Center(
        child: Text('Kelola Produk Page'),
      ),
    );
  }
}

class KelolaPembayaranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelola Pembayaran'),
      ),
      body: Center(
        child: Text('Kelola Pembayaran Page'),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Asrama'),
      ),
      body: Center(
        child: Text('Informasi Asrama Page'),
      ),
    );
  }
}
