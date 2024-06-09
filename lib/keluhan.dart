import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Widget> messages = [];

  @override
  void initState() {
    super.initState();
    messages.add(_buildReceivedMessage(
        'Silakan memilih pertanyaan yang dapat anda pilih. sistem kami akan menjawab otomatis keluhan anda'));
    messages.add(_buildIssueSelection());
  }

  static Widget _buildSentMessage(String message) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static Widget _buildReceivedMessage(String message) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildIssueSelection() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Kerusakan Fasilitas'),
          Divider(),
          Text('Kecelakaan/Bencana'),
          Divider(),
          ExpansionTile(
            title: Text('Keluhan Air Asrama'),
            children: [
              ListTile(
                title: Text('1. Air mandi kotor / bau'),
                onTap: () {
                  setState(() {
                    messages.add(_buildSentMessage('1. Air mandi kotor / bau'));
                    messages.add(_buildReceivedMessage('Chat dengan Admin'));
                    messages.add(_buildReceivedMessage(
                        'Halo, Ada yang bisa dibantu dik?'));
                  });
                },
              ),
              ListTile(
                title: Text('2. Kran air tidak berfungsi'),
                onTap: () {
                  setState(() {
                    messages
                        .add(_buildSentMessage('2. Kran air tidak berfungsi'));
                    messages.add(_buildReceivedMessage('Chat dengan Admin'));
                    messages.add(_buildReceivedMessage(
                        'Halo, Ada yang bisa dibantu dik?'));
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pelayanan Pengaduan Asrama'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the main page
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: messages,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.emoji_emotions, color: Colors.red),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Ketik pesan disini..',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      messages.add(_buildSentMessage(_controller.text));
                      messages.add(_buildReceivedMessage(
                          'Halo, Ada yang bisa dibantu dik?'));
                      _controller.clear();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
