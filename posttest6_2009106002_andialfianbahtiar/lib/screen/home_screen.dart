import 'package:flutter/material.dart';
import 'package:posttest6_2009106002_andialfianbahtiar/getx_controller/text_controller.dart';
import 'package:posttest6_2009106002_andialfianbahtiar/screen/bantusekitar/bantu_sekitar_detail_screen.dart';
import 'package:posttest6_2009106002_andialfianbahtiar/screen/biodata_home_screen.dart';
import 'package:posttest6_2009106002_andialfianbahtiar/screen/butuhbantuan/butuh_bantuan_detail_screen.dart';
import 'package:posttest6_2009106002_andialfianbahtiar/screen/landing_screen.dart';
import 'package:posttest6_2009106002_andialfianbahtiar/screen/validasiwarga/validasi_warga_detail_screen.dart';
import 'package:get/get.dart';

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

  @override
  Widget build(BuildContext context) {
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
                          builder: (context) => ValidasiWargaDetailScreen()),
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
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Cari"),
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
                child: Text("${tc.alamatEditingController.text}", style: TextStyle(fontSize: 18)),
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
