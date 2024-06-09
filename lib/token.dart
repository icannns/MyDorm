import 'package:flutter/material.dart';

class BeliTokenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beli Token'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BeliTokenForm(),
      ),
    );
  }
}

class BeliTokenForm extends StatefulWidget {
  @override
  _BeliTokenFormState createState() => _BeliTokenFormState();
}

class _BeliTokenFormState extends State<BeliTokenForm> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _whatsappNumber;
  String? _building;
  String? _roomNumber;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Text(
            'Isi Data Diri',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Masukkan alamat asrama yang ingin kamu isi token-nya',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          _buildNameField(),
          SizedBox(height: 16),
          _buildWhatsAppField(),
          SizedBox(height: 16),
          _buildBuildingField(),
          SizedBox(height: 16),
          _buildRoomNumberField(),
          SizedBox(height: 16),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  TextFormField _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nama',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Tolong masukkan nama';
        }
        return null;
      },
      onSaved: (value) {
        _name = value;
      },
    );
  }

  TextFormField _buildWhatsAppField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'No. Whatsapp',
      ),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Tolong masukkan nomor WhatsApp';
        }
        return null;
      },
      onSaved: (value) {
        _whatsappNumber = value;
      },
    );
  }

  DropdownButtonFormField<String> _buildBuildingField() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Gedung',
      ),
      items: ['Gedung A', 'Gedung B', 'Gedung C']
          .map((label) => DropdownMenuItem(
                child: Text(label),
                value: label,
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Tolong pilih gedung';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          _building = value;
        });
      },
    );
  }

  TextFormField _buildRoomNumberField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nomor Kamar',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Tolong masukkan nomor kamar';
        }
        return null;
      },
      onSaved: (value) {
        _roomNumber = value;
      },
    );
  }

  Center _buildSubmitButton() {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50), // Button size
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            // Process the data
            print('Name: $_name');
            print('WhatsApp: $_whatsappNumber');
            print('Building: $_building');
            print('Room Number: $_roomNumber');
          }
        },
        child: Text('Lanjut'),
      ),
    );
  }
}
