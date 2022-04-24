import 'package:flutter/material.dart';

enum Gender { male, female }

class BiodataScreen extends StatefulWidget {
  const BiodataScreen({Key? key}) : super(key: key);

  @override
  State<BiodataScreen> createState() => _BiodataScreenState();
}

class _BiodataScreenState extends State<BiodataScreen> {
  String namaDepan = "", namaBelakang = "", alamat = "", jeniskelamin = "";

  final namaDepanController = TextEditingController();
  final namaBelakangController = TextEditingController();
  final alamatController = TextEditingController();

  Gender? jenisKelamin = Gender.male;

  @override
  void dispose() {
    namaDepanController.dispose();
    namaBelakangController.dispose();
    alamatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (jenisKelamin) {
      case Gender.male:
        jeniskelamin = "Laki-Laki";
        break;
      case Gender.female:
        jeniskelamin = "Perempuan";
        break;
      default:
        jeniskelamin = "Tidak Diketahui";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("#BantuSesama - Biodata"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 15,
          ),
          Center(child: Text("Informasi Data", style: TextStyle(fontSize: 22),)),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: namaDepanController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Nama Depan"),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: namaBelakangController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Nama Belakang"),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: alamatController,
            maxLines: 4,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Alamat"),
          ),
          ListTile(
            leading: Radio(
                value: Gender.male,
                groupValue: jenisKelamin,
                onChanged: (Gender? value) {
                  setState(() {
                    jenisKelamin = value;
                  });
                }),
            title: Text("Laki-Laki"),
          ),
          ListTile(
            leading: Radio(
                value: Gender.female,
                groupValue: jenisKelamin,
                onChanged: (Gender? value) {
                  setState(() {
                    jenisKelamin = value;
                  });
                }),
            title: Text("Perempuan"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                namaDepan = namaDepanController.text;
                namaBelakang = namaBelakangController.text;
                alamat = alamatController.text;
              });
            },
            child: Text("Simpan"),
            style: ElevatedButton.styleFrom(primary: Colors.blue),
          ),
          Divider(),
          Center(child: Text("Hasil Data", style: TextStyle(fontSize: 22),)),
          Divider(),
          Text(
            "Nama               : ${namaDepan} ${namaBelakang}",
            style: TextStyle(fontSize: 24),
          ),
          Text(
            "Alamat             : ${alamat}",
            style: TextStyle(fontSize: 24),
          ),
          Text(
            "Jenis Kelamin : ${jeniskelamin}",
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}