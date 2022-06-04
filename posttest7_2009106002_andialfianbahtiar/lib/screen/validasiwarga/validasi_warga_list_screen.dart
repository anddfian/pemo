import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:posttest7_2009106002_andialfianbahtiar/screen/validasiwarga/validasi_warga_detail_screen.dart';

class ValidasiWargaListScreen extends StatelessWidget {
  const ValidasiWargaListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference bantusekitar = firestore.collection("butuhbantuan");

    return Scaffold(
      appBar: AppBar(
        title: Text("#BantuSesama - Validasi Warga"),
      ),
      body: ListView(
        children: [
          // VIEW DATA HERE
          StreamBuilder<QuerySnapshot>(
            stream: bantusekitar.snapshots(),
            builder: (_, snapshot) {
              return (snapshot.hasData)
                  ? Column(
                      children: snapshot.data!.docs
                          .map((e) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ValidasiWargaDetailScreen(
                                              id: e.id,
                                              kepalaKeluarga:
                                                  e.get('namaKepalaKeluarga'),
                                              jumlahAnggotaKeluarga: e
                                                  .get('jumlahAnggotaKeluarga'),
                                              nomorHandphone:
                                                  e.get('nomorHandphone'),
                                              pekerjaan: e.get('pekerjaan'),
                                              detailBantuan:
                                                  e.get('detailBantuan'),
                                              alamat: e.get('alamat'),
                                              bantuan: e.get('bantuan'),
                                            )),
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.blue)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: Text(
                                              e.get('namaKepalaKeluarga'),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${e.get('jumlahAnggotaKeluarga')} Anggota Keluarga",
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Bantuan: ${e.get('bantuan')}x")
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                    )
                  : Text('Loading...');
            },
          ),
        ],
      ),
    );
  }
}