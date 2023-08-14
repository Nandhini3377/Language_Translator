import 'dart:async';

import 'package:flutter/material.dart';
import 'package:language_translator/Screens/Home.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    });
    //_controller=AnimationController(vsync:this. );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:160.0),
            child: Text('ATranslator',style: GoogleFonts.amarante(fontSize: 46,color: Colors.cyan),),
          ),
        SizedBox(height: 50,),
          LottieBuilder.asset('assets/lottie.json',width: 360,repeat: true,
          )],
      ),
    );
  }
}
