import 'package:flutter/material.dart';
import 'package:posttest6_2009106002_andialfianbahtiar/getx_controller/text_controller.dart';
import 'package:get/get.dart';
import 'package:posttest6_2009106002_andialfianbahtiar/screen/home_screen.dart';

enum Gender { male, female }

class BiodataScreen extends StatefulWidget {
  const BiodataScreen({Key? key}) : super(key: key);

  @override
  State<BiodataScreen> createState() => _BiodataScreenState();
}

class _BiodataScreenState extends State<BiodataScreen> {
  String namaDepan = "", namaBelakang = "", alamat = "", jeniskelamin = "";

  final GetxTextController tc = Get.put(GetxTextController());

  Gender? jenisKelamin = Gender.male;

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
          Center(
              child: Text(
            "Informasi Data",
            style: TextStyle(fontSize: 22),
          )),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: tc.namaEditingController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Nama Lengkap"),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: tc.alamatEditingController,
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

              final snackBar = SnackBar(
                content: Text("Sukses: Data berhasil disimpan!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                duration: Duration(seconds: 3),
                padding: EdgeInsets.all(10),
                backgroundColor: Colors.blue,
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Text("Simpan"),
            style: ElevatedButton.styleFrom(primary: Colors.blue),
          ),
        ],
      ),
    );
  }
}