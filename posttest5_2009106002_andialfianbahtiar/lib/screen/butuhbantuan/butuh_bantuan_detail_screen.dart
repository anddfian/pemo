import 'package:flutter/material.dart';
import 'package:posttest5_2009106002_andialfianbahtiar/screen/home_screen.dart';

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
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Nama Kepala Keluarga"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Jumlah Anggota Keluarga"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
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
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Pekerjaan"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Jenis Pekerjaan"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Jumlah Penghasilan Sebelum COVID-19"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Jumlah Penghasilan Selama COVID-19"),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child:
                  Text("Bantuan Yang Diperlukan", style: TextStyle(fontSize: 18)),
              padding: EdgeInsets.only(left: 5, bottom: 5),
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Tuliskan Detail Bantuan Yang Diperlukan"),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child:
                  Text("Alamat Rumah Anda", style: TextStyle(fontSize: 18)),
              padding: EdgeInsets.only(left: 5, bottom: 5),
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Provinsi"),
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Kab/Kota"),
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Kecamatan"),
            ),
            SizedBox(height: 10,),
            Center(child: ElevatedButton(onPressed: () {
              Navigator.pop(context);
              CustomAlert(context, "Permintaan anda telah di simpan.");
            }, child: Container(child: Center(child: Text("Kirim")), width: 350,), style: ElevatedButton.styleFrom(primary: Colors.blue),)),
            SizedBox(height: 10,),
          ],
        )
      ]),
    );
  }
}

Future<dynamic> CustomAlert(BuildContext context, String pesan) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Butuh Bantuan"),
        content: Text(pesan),
        actions: [
          TextButton(onPressed: () {
            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
            Navigator.of(context).pop();
          }, child: Text("Tutup"))
        ],
      );
    },
  );
}