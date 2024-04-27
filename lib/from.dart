import 'package:flutter/material.dart';

class MahasiswaForm extends StatefulWidget {
  final Function(String, String, String) onTambahData;

  MahasiswaForm({required this.onTambahData});

  @override
  _MahasiswaFormState createState() => _MahasiswaFormState();
}

class _MahasiswaFormState extends State<MahasiswaForm> {
  final TextEditingController nimController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: nimController,
            decoration: InputDecoration(labelText: 'NIM'),
          ),
          TextField(
            controller: namaController,
            decoration: InputDecoration(labelText: 'Nama'),
          ),
          TextField(
            controller: alamatController,
            decoration: InputDecoration(labelText: 'Alamat'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              widget.onTambahData(
                nimController.text,
                namaController.text,
                alamatController.text,
              );
            },
            child: Text(
              'Tambahkan',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
