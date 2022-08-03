import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:popwatch/auth/authscreen.dart';
import 'package:popwatch/main.dart';
import 'package:popwatch/screens/home.dart';
import 'package:popwatch/screens/signin_screen.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return MainScreen();
          } else {
            return AuthScreen();
          }
        },
      )
    );
  }
}
