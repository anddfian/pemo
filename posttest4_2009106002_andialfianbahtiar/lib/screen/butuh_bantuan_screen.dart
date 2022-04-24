import 'package:flutter/material.dart';
import 'package:posttest4_2009106002_andialfianbahtiar/screen/home_screen.dart';

class ButuhBantuanPage extends StatelessWidget {
  const ButuhBantuanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("#BantuSesama - Butuh Bantuan"),
      ),
      body: Container(
        color: Color(0xffEFF2F4),
        child: Center(child: Text("Dalam Pengembangan"))
      ),
    );
  }
}