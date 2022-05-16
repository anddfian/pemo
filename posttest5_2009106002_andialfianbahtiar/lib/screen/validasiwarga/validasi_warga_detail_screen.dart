import 'package:flutter/material.dart';

enum Choice { iya, tidak }

class ValidasiWargaDetailScreen extends StatefulWidget {
  const ValidasiWargaDetailScreen({Key? key}) : super(key: key);

  @override
  State<ValidasiWargaDetailScreen> createState() =>
      _ValidasiWargaDetailScreenState();
}

class _ValidasiWargaDetailScreenState extends State<ValidasiWargaDetailScreen> {
  String jenispilihan = "";
  Choice? jenisPilihan = Choice.iya;
  Choice? jenisPilihan2 = Choice.iya;
  Choice? jenisPilihan3 = Choice.iya;

  @override
  Widget build(BuildContext context) {
    switch (jenisPilihan) {
      case Choice.iya:
        jenispilihan = "Iya";
        break;
      case Choice.tidak:
        jenispilihan = "Tidak";
        break;
      default:
        jenispilihan = "Tidak Diketahui";
    }
    switch (jenisPilihan2) {
      case Choice.iya:
        jenispilihan = "Iya";
        break;
      case Choice.tidak:
        jenispilihan = "Tidak";
        break;
      default:
        jenispilihan = "Tidak Diketahui";
    }
    switch (jenisPilihan3) {
      case Choice.iya:
        jenispilihan = "Iya";
        break;
      case Choice.tidak:
        jenispilihan = "Tidak";
        break;
      default:
        jenispilihan = "Tidak Diketahui";
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("#BantuSesama - Validasi Warga"),
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Center(
                      child: Text("Validasi Keluarga A",
                          style: TextStyle(fontSize: 24))),
                  padding: EdgeInsets.only(left: 5, top: 10),
                ),
                Divider(),
                Container(
                  child: Text("Keluarga A",
                      style: TextStyle(fontSize: 18, color: Colors.green)),
                  padding: EdgeInsets.only(left: 5),
                ),
                Container(
                  child: Text("1,5 meter",
                      style: TextStyle(fontSize: 12, color: Colors.green)),
                  padding: EdgeInsets.only(left: 5, bottom: 10),
                ),
                Container(
                  child: Text("Alamat",
                      style: TextStyle(fontSize: 12, color: Colors.green)),
                  padding: EdgeInsets.only(left: 5),
                ),
                Container(
                  child: Text("Jl. Perjuangan 7 RT. 1",
                      style: TextStyle(fontSize: 18)),
                  padding: EdgeInsets.only(left: 5, bottom: 10),
                ),
                Container(
                  child: Text("Pekerjaan",
                      style: TextStyle(fontSize: 12, color: Colors.green)),
                  padding: EdgeInsets.only(left: 5),
                ),
                Container(
                  child: Text("Mahasiswa", style: TextStyle(fontSize: 18)),
                  padding: EdgeInsets.only(left: 5, bottom: 10),
                ),
                Container(
                  child: Text("Jumlah Anggota Keluarga",
                      style: TextStyle(fontSize: 12, color: Colors.green)),
                  padding: EdgeInsets.only(left: 5),
                ),
                Container(
                  child: Text("4 Orang", style: TextStyle(fontSize: 18)),
                  padding: EdgeInsets.only(left: 5, bottom: 10),
                ),
                Container(
                  child: Text("Jenis Bantuan Yang Dibutuhkan",
                      style: TextStyle(fontSize: 12, color: Colors.green)),
                  padding: EdgeInsets.only(left: 5),
                ),
                Container(
                  child: Text("Makanan Pokok", style: TextStyle(fontSize: 18)),
                  padding: EdgeInsets.only(left: 5, bottom: 10),
                ),
                Divider(),
                Container(
                  child: Text("Apakah Anda Mengenal Keluarga Ini?",
                      style: TextStyle(fontSize: 18)),
                  padding: EdgeInsets.only(left: 5),
                ),
                ListTile(
                  leading: Radio(
                      value: Choice.iya,
                      groupValue: jenisPilihan,
                      onChanged: (Choice? value) {
                        setState(() {
                          jenisPilihan = value;
                        });
                      }),
                  title: Text("Iya"),
                ),
                ListTile(
                  leading: Radio(
                      value: Choice.tidak,
                      groupValue: jenisPilihan,
                      onChanged: (Choice? value) {
                        setState(() {
                          jenisPilihan = value;
                        });
                      }),
                  title: Text("Tidak"),
                ),
                Container(
                  child: Text(
                      "Apakah Data Yang Ditampilkan Sesuai Dengan Pengetahuan Anda?",
                      style: TextStyle(fontSize: 18)),
                  padding: EdgeInsets.only(left: 5),
                ),
                ListTile(
                  leading: Radio(
                      value: Choice.iya,
                      groupValue: jenisPilihan2,
                      onChanged: (Choice? value) {
                        setState(() {
                          jenisPilihan2 = value;
                        });
                      }),
                  title: Text("Iya"),
                ),
                ListTile(
                  leading: Radio(
                      value: Choice.tidak,
                      groupValue: jenisPilihan2,
                      onChanged: (Choice? value) {
                        setState(() {
                          jenisPilihan2 = value;
                        });
                      }),
                  title: Text("Tidak"),
                ),
                Container(
                  child: Text("Apakah Menurut Anda Keluarga Ini Butuh Bantuan?",
                      style: TextStyle(fontSize: 18)),
                  padding: EdgeInsets.only(left: 5),
                ),
                ListTile(
                  leading: Radio(
                      value: Choice.iya,
                      groupValue: jenisPilihan3,
                      onChanged: (Choice? value) {
                        setState(() {
                          jenisPilihan2 = value;
                        });
                      }),
                  title: Text("Iya"),
                ),
                ListTile(
                  leading: Radio(
                      value: Choice.tidak,
                      groupValue: jenisPilihan3,
                      onChanged: (Choice? value) {
                        setState(() {
                          jenisPilihan2 = value;
                        });
                      }),
                  title: Text("Tidak"),
                ),
              ],
            ),
            Center(
                child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                CustomAlert(context, "Validasi anda telah di simpan.");
              },
              child: Container(
                child: Center(child: Text("Validasi")),
                width: 350,
              ),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
            )),
            SizedBox(
              height: 10,
            ),
          ],
        ));
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
                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                Navigator.of(context).pop();
              },
              child: Text("Tutup"))
        ],
      );
    },
  );
}
