import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popwatch/screens/signin_screen.dart';
import 'package:popwatch/screens/register_screen.dart';
import '../constants.dart';


class LoginRegisterScreen extends StatelessWidget {
  const LoginRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    automaticallyImplyLeading: true,
    leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)
    ),
      ),
      body: Container(
        alignment: Alignment.center,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Container(
              height:50
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFFFCCBC),
              ),
              onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen())
              );},
              icon: Icon(
                Icons.login,
                size: 24.0,
              ),
              label: Text('Sign In'),
            ),
            Container(
                height:10
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFFFCCBC),
              ),
              onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterScreen())
              );},
              icon: Icon(
                Icons.login,
                size: 24.0,
              ),
              label: Text('Register'),
            )
          ],
        ),
      )
    );
  }
}
