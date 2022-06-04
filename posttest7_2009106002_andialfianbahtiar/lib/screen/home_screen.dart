import 'package:flutter/material.dart';
import 'package:posttest7_2009106002_andialfianbahtiar/getx_controller/text_controller.dart';
import 'package:posttest7_2009106002_andialfianbahtiar/screen/bantusekitar/bantu_sekitar_list_screen.dart';
import 'package:posttest7_2009106002_andialfianbahtiar/screen/biodata_home_screen.dart';
import 'package:posttest7_2009106002_andialfianbahtiar/screen/butuhbantuan/butuh_bantuan_detail_screen.dart';
import 'package:posttest7_2009106002_andialfianbahtiar/screen/landing_screen.dart';
// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';
import 'package:posttest7_2009106002_andialfianbahtiar/screen/validasiwarga/validasi_warga_list_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];
  int _index = 0;

  final GetxTextController tc = Get.find();

  final TextEditingController cariController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference bantusekitar = firestore.collection("butuhbantuan");

    return Scaffold(
      appBar: AppBar(title: Text("#BantuSesama")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: null,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/Logo.png")),
                  color: Color(0xffEFF2F4)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Landing Screen"),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (_) {
                    return LandingScreen();
                  },
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Biodata"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) {
                    return BiodataHomeScreen();
                  },
                ));
              },
            )
          ],
        ),
      ),
      body: [
        Container(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BantuSekitarListScreen()),
                    );
                  },
                  child: Image.asset(
                    "assets/BantuSekitar.png",
                    width: 300,
                    height: 190,
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ButuhBantuanDetailScreen()),
                    );
                  },
                  child: Image.asset(
                    "assets/ButuhBantuan.png",
                    width: 300,
                    height: 190,
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ValidasiWargaListScreen()),
                    );
                  },
                  child: Image.asset(
                    "assets/ValidasiWarga.png",
                    width: 300,
                    height: 190,
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                )
              ])),
        ),
        Container(
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: cariController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Cari"),
              ),
              // VIEW DATA HERE
              StreamBuilder<QuerySnapshot>(
                stream: bantusekitar
                    .where('namaKepalaKeluarga', isEqualTo: cariController.text)
                    .snapshots(),
                builder: (_, snapshot) {
                  return (snapshot.hasData)
                      ? Column(
                          children: snapshot.data!.docs
                              .map((e) => GestureDetector(
                                    child: Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border:
                                              Border.all(color: Colors.blue)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                              Text(
                                                  "Bantuan: ${e.get('bantuan')}x")
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
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Center(
                    child: Text("Profile",
                        style: TextStyle(fontSize: 24, color: Colors.green))),
                padding: EdgeInsets.only(left: 5, top: 10),
              ),
              Divider(),
              Container(
                child: Text("Nama",
                    style: TextStyle(fontSize: 12, color: Colors.green)),
                padding: EdgeInsets.only(left: 5),
              ),
              Container(
                child: Text("${tc.namaEditingController.text}",
                    style: TextStyle(fontSize: 18)),
                padding: EdgeInsets.only(left: 5, bottom: 10),
              ),
              Container(
                child: Text("Alamat",
                    style: TextStyle(fontSize: 12, color: Colors.green)),
                padding: EdgeInsets.only(left: 5),
              ),
              Container(
                child: Text("${tc.alamatEditingController.text}",
                    style: TextStyle(fontSize: 18)),
                padding: EdgeInsets.only(left: 5, bottom: 10),
              ),
            ],
          ),
        ),
      ].elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavBarItems,
        currentIndex: _index,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}