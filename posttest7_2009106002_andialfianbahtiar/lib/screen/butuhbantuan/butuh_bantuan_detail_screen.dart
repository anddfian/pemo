import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final TextEditingController namaKepalaKeluargaController =
    TextEditingController();
final TextEditingController jumlahAnggotaKeluargaController =
    TextEditingController();
final TextEditingController nomorHandphoneController = TextEditingController();
final TextEditingController pekerjaanController = TextEditingController();
final TextEditingController detailBantuanController = TextEditingController();
final TextEditingController alamatController = TextEditingController();

class ButuhBantuanDetailScreen extends StatelessWidget {
  const ButuhBantuanDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("#BantuSesama - Butuh Bantuan"),
      ),
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Center(
                  child: Text("Daftarkan Keluarga Anda",
                      style: TextStyle(fontSize: 24))),
              padding: EdgeInsets.only(left: 5, top: 10),
            ),
            Divider(),
            Container(
              child:
                  Text("Keterangan Keluarga", style: TextStyle(fontSize: 18)),
              padding: EdgeInsets.only(left: 5, bottom: 5),
            ),
            TextField(
              controller: namaKepalaKeluargaController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Nama Kepala Keluarga"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: jumlahAnggotaKeluargaController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Jumlah Anggota Keluarga"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: nomorHandphoneController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Nomor Handphone"),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child:
                  Text("Keterangan Pekerjaan", style: TextStyle(fontSize: 18)),
              padding: EdgeInsets.only(left: 5, bottom: 5),
            ),
            TextField(
              controller: pekerjaanController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Pekerjaan"),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text("Bantuan Yang Diperlukan",
                  style: TextStyle(fontSize: 18)),
              padding: EdgeInsets.only(left: 5, bottom: 5),
            ),
            TextField(
              controller: detailBantuanController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Tuliskan Detail Bantuan Yang Diperlukan"),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text("Alamat Rumah", style: TextStyle(fontSize: 18)),
              padding: EdgeInsets.only(left: 5, bottom: 5),
            ),
            TextField(
              controller: alamatController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Alamat"),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                CustomAlert(context, "Permintaan anda telah di simpan.");
              },
              child: Container(
                child: Center(child: Text("Kirim")),
                width: 350,
              ),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
            )),
            SizedBox(
              height: 10,
            ),
          ],
        )
      ]),
    );
  }
}

Future<dynamic> CustomAlert(BuildContext context, String pesan) {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference butuhbantuan = firestore.collection("butuhbantuan");
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Butuh Bantuan"),
        content: Text(pesan),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                butuhbantuan.add({
                  'namaKepalaKeluarga': namaKepalaKeluargaController.text,
                  'jumlahAnggotaKeluarga':
                      int.tryParse(jumlahAnggotaKeluargaController.text),
                  'nomorHandphone': nomorHandphoneController.text,
                  'pekerjaan': pekerjaanController.text,
                  'detailBantuan': detailBantuanController.text,
                  'alamat': alamatController.text,
                  'bantuan': 0
                });

                namaKepalaKeluargaController.text = '';
                jumlahAnggotaKeluargaController.text = '';
                nomorHandphoneController.text = '';
                pekerjaanController.text = '';
                detailBantuanController.text = '';
                alamatController.text = '';
              },
              child: Text("Tutup"))
        ],
      );
    },
  );
}