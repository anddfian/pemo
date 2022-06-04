import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ValidasiWargaDetailScreen extends StatelessWidget {
  const ValidasiWargaDetailScreen(
      {Key? key,
      required this.id,
      required this.kepalaKeluarga,
      required this.jumlahAnggotaKeluarga,
      required this.nomorHandphone,
      required this.pekerjaan,
      required this.detailBantuan,
      required this.alamat,
      required this.bantuan})
      : super(key: key);

  final String id,
      kepalaKeluarga,
      nomorHandphone,
      pekerjaan,
      detailBantuan,
      alamat;
  final int jumlahAnggotaKeluarga, bantuan;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference bantusekitar = firestore.collection("butuhbantuan");

    return Scaffold(
      appBar: AppBar(
        title: Text("#BantuSesama - Validasi Warga"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Center(
                child: Text("Keluarga ${kepalaKeluarga}",
                    style: TextStyle(fontSize: 24, color: Colors.green))),
            padding: EdgeInsets.only(left: 5, top: 10),
          ),
          Divider(),
          Container(
            child: Text("Jumlah Anggota Keluarga",
                style: TextStyle(fontSize: 12, color: Colors.green)),
            padding: EdgeInsets.only(left: 5),
          ),
          Container(
            child: Text("${jumlahAnggotaKeluarga}",
                style: TextStyle(fontSize: 18)),
            padding: EdgeInsets.only(left: 5, bottom: 10),
          ),
          Container(
            child: Text("Nomor Handphone",
                style: TextStyle(fontSize: 12, color: Colors.green)),
            padding: EdgeInsets.only(left: 5),
          ),
          Container(
            child: Text("${nomorHandphone}", style: TextStyle(fontSize: 18)),
            padding: EdgeInsets.only(left: 5, bottom: 10),
          ),
          Container(
            child: Text("Pekerjaan",
                style: TextStyle(fontSize: 12, color: Colors.green)),
            padding: EdgeInsets.only(left: 5),
          ),
          Container(
            child: Text("${pekerjaan}", style: TextStyle(fontSize: 18)),
            padding: EdgeInsets.only(left: 5, bottom: 10),
          ),
          Container(
            child: Text("Jenis Bantuan Yang Dibutuhkan",
                style: TextStyle(fontSize: 12, color: Colors.green)),
            padding: EdgeInsets.only(left: 5),
          ),
          Container(
            child: Text("${detailBantuan}", style: TextStyle(fontSize: 18)),
            padding: EdgeInsets.only(left: 5, bottom: 10),
          ),
          Container(
            child: Text("Alamat",
                style: TextStyle(fontSize: 12, color: Colors.green)),
            padding: EdgeInsets.only(left: 5),
          ),
          Container(
            child: Text("${alamat}", style: TextStyle(fontSize: 18)),
            padding: EdgeInsets.only(left: 5, bottom: 10),
          ),
          Divider(),
          Center(
              child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              bantusekitar.doc(id).delete();
              CustomAlert(context, "Permintaan anda telah di hapus.");
            },
            child: Container(
              child: Center(child: Text("Hapus")),
              width: 350,
            ),
            style: ElevatedButton.styleFrom(primary: Colors.blue),
          )),
        ],
      ),
    );
  }
}

Future<dynamic> CustomAlert(BuildContext context, String pesan) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Validasi Warga"),
        content: Text(pesan),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Tutup"))
        ],
      );
    },
  );
}