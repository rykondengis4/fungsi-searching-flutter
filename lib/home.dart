import 'package:flutter/material.dart';
import 'from.dart';

class Mahasiswa {
  final String nim;
  final String nama;
  final String alamat;

  Mahasiswa({required this.nim, required this.nama, required this.alamat});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Mahasiswa> dataMahasiswa = [];

  void tambahData(String nim, String nama, String alamat) {
    Mahasiswa mahasiswa = Mahasiswa(nim: nim, nama: nama, alamat: alamat);
    setState(() {
      dataMahasiswa.add(mahasiswa);
    });
  }

  void cariMahasiswa(String nimCari) {
    Mahasiswa? mahasiswa = dataMahasiswa.firstWhere(
      (m) => m.nim == nimCari,
      orElse: () => Mahasiswa(nim: '', nama: '', alamat: ''),
    );

    if (mahasiswa.nim.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Data Mahasiswa'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('NIM: ${mahasiswa.nim}'),
                Text('Nama: ${mahasiswa.nama}'),
                Text('Alamat: ${mahasiswa.alamat}'),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Data Mahasiswa'),
            content: Text('NIM $nimCari tidak ditemukan atau belum diinput.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mahasiswa'),
      ),
      body: Column(
        children: [
          MahasiswaForm(onTambahData: tambahData),
          ElevatedButton(
            onPressed: () {
              TextEditingController nimController = TextEditingController();

              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Pencarian'),
                    content: TextField(
                      controller: nimController,
                      decoration: InputDecoration(labelText: 'NIM'),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          cariMahasiswa(nimController.text);
                        },
                        child: Text('Cari'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Batal'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              'Cari',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dataMahasiswa.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('NIM: ${dataMahasiswa[index].nim}'),
                  subtitle: Text(
                      'Nama: ${dataMahasiswa[index].nama}\nAlamat: ${dataMahasiswa[index].alamat}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
