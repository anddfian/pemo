import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      color: Color(0xffEFF2F4),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:20),
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
                    image: DecorationImage(
                      image: AssetImage("assets/img.png"))
                  ),
                ),
              ),
               Text("#BantuSesama",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
               ),
              SizedBox(height: 20,),
              Text("Rasakan cara yang lebih mudah untuk\nmembantu orang lain!",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
               Text("Hubungkan bantuan Anda ke teman & sahabat Anda",style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),
               ),
              SizedBox(height: 100,),
             Center(
               child: ClipRRect(
                 borderRadius: BorderRadius.circular(20),
                 child: Container(
                   width: 200,
                   height: 48,
                   color: Colors.blueAccent,
                   child: Center(
                     child: Text("Memulai",
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 22,
                       fontWeight: FontWeight.normal,
                       ),
                       ),
                   ),
                 ),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}