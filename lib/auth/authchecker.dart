import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:popwatch/auth/authscreen.dart';
import 'package:popwatch/main.dart';


class AuthCheck extends StatelessWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>( // checks if the user is logged in or not.
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData){ // if the user is logged in, then go to the home screen.
            return MainScreen();
          } else {
            return AuthScreen(); // if the user is not logged in, then go to the sign in screen.
          }
        },
      )
    );
  }
}
