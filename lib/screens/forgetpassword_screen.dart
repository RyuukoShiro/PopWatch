import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>(); // calls the form key.

  void validate(){ // check if there is any values in the validation
    if(formkey.currentState!.validate()){
      print("validated");
    }else{
      print("Not Validated");
    }
  }

  Future passwordReset() async { // calls the function passwordReset from the firebase_auth.dart
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text('Password reset link has been sent! Check your email'),
        );
      });
    } on FirebaseAuthException catch (e) { // if there is any error, it will show the error message.
      print (e);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  }

  final _emailController = TextEditingController(); // calls the text editing controller.
  @override
  void dispose() { // dispose the text editing controller.
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFAB91),
        title: const Text('Forget Password', textAlign: TextAlign.center,),
      ),
      backgroundColor: Color(0xFFFFCCBC),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/popcorn.png',
                    height: 200.0,
                    width: 225.0,
                  ),
                  SizedBox(height: 15),
                  Text('Enter your Email and we will send\'you password reset link',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: TextFormField(
                          // Validator is used to check if there is any values within the TextFormField
                          // For EmailValidator is able to check whether it is a valid email or not with it is checking the @ and the .com
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                            EmailValidator(errorText: "Enter valid email id"),
                          ]
                          ),
                          controller: _emailController, // calls the text editing controller.
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Email',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: GestureDetector(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFAB91),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child:
                              Text("Send Email",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        //formkey checks whether if there is any values currently in the TextFormView
                        if (formkey.currentState!.validate()){ //
                          passwordReset();
                        }
                      }
                  ),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}
