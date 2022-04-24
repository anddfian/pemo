import 'package:flutter/material.dart';
import 'package:posttest4_2009106002_andialfianbahtiar/screen/home_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffEFF2F4),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Center(
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage("assets/img.png"))),
                ),
              ),
              Text(
                "#BantuSesama oleh Andi Alfian B.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Rasakan cara yang lebih mudah untuk\nmembantu orang lain!",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Hubungkan bantuan Anda ke teman & sahabat Anda",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 100,
              ),
              Center(
                  child: SizedBox(
                width: 200,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Text("Memulai"),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}