import 'package:flutter/material.dart';
import 'dart:async';
import 'package:posttest5_2009106002_andialfianbahtiar/screen/landing_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenStart();
  }

  splashScreenStart() {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LandingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height =  MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/Logo.png",
          width: width / 2,
          height: height / 2,
        ),
      ),
    );
  }
}
