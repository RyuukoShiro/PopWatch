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
  bool showLoginScreen = true; // calls the showLoginScreen function.

  void toggleScreens() { // calls the toggleScreens function.
    setState(() {
      showLoginScreen = !showLoginScreen; // if the showLoginScreen is true, then set it to false.
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) { // if the showLoginScreen is true, then go to the sign in screen.
      return SignInScreen(showRegisterScreen: toggleScreens);
    } else {
      return RegisterScreen(showLoginScreen: toggleScreens); // if the showLoginScreen is false, then go to the register screen.
    }
  }
}
