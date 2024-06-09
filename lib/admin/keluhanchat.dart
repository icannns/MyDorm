import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keluhan Chat/Call'),
        backgroundColor: Colors.red[900],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red[900],
              ),
              child: Text(
                'MyDorm',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Data Mahasiswa'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('Kelola Produk'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Kelola Pembayaran'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('Keluhan Chat/Call'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Informasi Asrama'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                UserTile(name: 'Annette Black', message: 'Hey, do you talk to him?', time: '2 days ago'),
                UserTile(name: 'Kyle Joner', message: 'Can you do it?', time: '3 days ago'),
                UserTile(name: 'Cameron Williamson', message: 'Thanks, I\'ll call you there.', time: '4 days ago'),
                UserTile(name: 'Jane Cooper', message: 'I sent it before.', time: '5 days ago'),
                UserTile(name: 'Brenda Smily', message: 'Sent it already.', time: '5 days ago'),
                UserTile(name: 'Jacob Jones', message: 'Miss a call', time: '6 days ago'),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: ChatScreen(),
          ),
        ],
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;

  UserTile({required this.name, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.red[900],
        child: Text(name[0], style: TextStyle(color: Colors.white)),
      ),
      title: Text(name),
      subtitle: Text(message),
      trailing: Text(time),
      onTap: () {},
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.red[900],
                child: Text('A', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(width: 10),
              Text(
                'Annette Black',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.call, color: Colors.green),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.video_call, color: Colors.red),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              ChatBubble(isMe: true, text: 'Hello! How can I help you?'),
              ChatBubble(isMe: false, text: 'I need some assistance with my account.'),
              ChatBubble(isMe: true, text: 'Sure, I can help with that. What seems to be the problem?'),
              ChatBubble(isMe: false, text: 'I am unable to log in to my account.'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Type your message',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.send),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isMe;
  final String text;

  ChatBubble({required this.isMe, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue[200] : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text),
      ),
    );
  }
}
