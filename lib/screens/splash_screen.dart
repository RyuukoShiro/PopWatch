import 'dart:async';

import 'package:flutter/material.dart';
import 'package:popwatch/main.dart';
import 'package:popwatch/auth/authchecker.dart';
import 'package:popwatch/screens/home.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  // The initState is used for the splashcreen to wait how more secs before returning back to the mainscreen
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement
      (context, MaterialPageRoute(builder: (context)=> AuthCheck())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFCCBC),
              Color(0xFFFFAB91),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
            Image.asset('assets/images/popcorn.png',
            height: 180.0,
            width: 225.0,
            ),
                Text("PopWatch",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

