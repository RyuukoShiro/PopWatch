import 'package:flutter/material.dart';
import 'package:popwatch/screens/register_screen.dart';
import 'package:popwatch/screens/signin_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  //show login page initially
  bool showLoginScreen = true;

  void toggleScreens() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return SignInScreen(showRegisterScreen: toggleScreens);
    } else {
      return RegisterScreen(showLoginScreen: toggleScreens);
    }
  }
}
