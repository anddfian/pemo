import 'package:flutter/material.dart';

class BantuSekitarListScreen extends StatelessWidget {
  const BantuSekitarListScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("#BantuSesama - Bantu Sekitar"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Center(child: Text("Keluarga A", style: TextStyle(fontSize: 24, color: Colors.green))),
            padding: EdgeInsets.only(left: 5, top: 10),
          ),
          Divider(),
          Container(
            child: Text("Alamat", style: TextStyle(fontSize: 12, color: Colors.green)),
            padding: EdgeInsets.only(left: 5),
          ),
          Container(
            child: Text("Jl. Perjuangan 7 RT. 1", style: TextStyle(fontSize: 18)),
            padding: EdgeInsets.only(left: 5, bottom: 10),
          ),
          Container(
            child: Text("Pekerjaan", style: TextStyle(fontSize: 12, color: Colors.green)),
            padding: EdgeInsets.only(left: 5),
          ),
          Container(
            child: Text("Mahasiswa", style: TextStyle(fontSize: 18)),
            padding: EdgeInsets.only(left: 5, bottom: 10),
          ),
          Container(
            child: Text("Jumlah Anggota Keluarga", style: TextStyle(fontSize: 12, color: Colors.green)),
            padding: EdgeInsets.only(left: 5),
          ),
          Container(
            child: Text("4 Orang", style: TextStyle(fontSize: 18)),
            padding: EdgeInsets.only(left: 5, bottom: 10),
          ),
          Container(
            child: Text("Jenis Bantuan Yang Dibutuhkan", style: TextStyle(fontSize: 12, color: Colors.green)),
            padding: EdgeInsets.only(left: 5),
          ),
          Container(
            child: Text("Makanan Pokok", style: TextStyle(fontSize: 18)),
            padding: EdgeInsets.only(left: 5, bottom: 10),
          ),
        ],
      ),
    );
  }
}