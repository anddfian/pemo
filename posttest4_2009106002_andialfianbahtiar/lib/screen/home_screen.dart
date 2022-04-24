import 'package:flutter/material.dart';
import 'package:posttest4_2009106002_andialfianbahtiar/screen/bantu_sekitar_screen.dart';
import 'package:posttest4_2009106002_andialfianbahtiar/screen/biodata_screen.dart';
import 'package:posttest4_2009106002_andialfianbahtiar/screen/butuh_bantuan_screen.dart';
import 'package:posttest4_2009106002_andialfianbahtiar/screen/validasi_warga_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("#BantuSesama")),
      drawer: Drawer(
//        backgroundColor: Colors.green,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("#BantuSesama"),
              decoration: BoxDecoration(color: Color(0xffEFF2F4)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Halaman Utama"),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (_) {
                    return HomeScreen();
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
                    return BiodataScreen();
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
              child: ListView(children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BantuSekitarPage()),
                );
              },
              child: Text("Bantu Sekitar"),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ButuhBantuanPage()),
                );
              },
              child: Text("Butuh Bantuan"),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ValidasiWargaPage()),
                );
              },
              child: Text("Validasi Warga"),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
            )
          ])),
          // color: Colors.red,
        ),
        Container(
          child: Center(child: Text("Dalam Pengembangan")),
          // color: Colors.yellow,
        ),
        Container(
          child: Center(child: Text("Dalam Pengembangan")),
          // color: Colors.green,
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