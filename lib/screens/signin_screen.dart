import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:popwatch/screens/forgetpassword_screen.dart';
import 'package:popwatch/screens/home_with_user.dart';
import 'package:popwatch/screens/profile_screen.dart';
import 'package:popwatch/screens/register_screen.dart';

class SignInScreen extends StatefulWidget {

  final VoidCallback showRegisterScreen;
  const SignInScreen({Key? key, required this.showRegisterScreen}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate(){
    if(formkey.currentState!.validate()){
      print("validated");
    }else{
      print("Not Validated");
    }
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim()
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', textAlign: TextAlign.center,),
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
                    Text('Welcome back, you\'ve been missed!',
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
                            controller: _emailController,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: TextFormField(
                            validator: MultiValidator([
                              // Validator is used to check if there is any values within the TextFormField
                              RequiredValidator(errorText: "* Required"),
                              MinLengthValidator(6,
                                  errorText: "Password should be atleast 6 characters"),
                              MaxLengthValidator(15,
                                  errorText:
                                  "Password should not be greater than 15 characters")
                            ]),
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: 'Password',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: Text('Forgot Password?',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFFFAB91),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context){
                                return ForgetPasswordScreen();
                              })
                            );
                          },
                        ),
                      ],
                    )),
                    SizedBox(height: 10),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: GestureDetector(
                          // onTap: signIn,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFAB91),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child:
                              Text("Sign In",
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
                        // if so will be routed to the MainScreenWithUser
                        if (formkey.currentState!.validate()){
                          signIn();
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('Login Successful!'),
                          ));
                        }
                      }
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member? ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                            child:
                            Text(
                              'Register now!',
                              style: TextStyle(
                                color: Color(0xFFFFAB91),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap:() {
                              widget.showRegisterScreen();
                            }
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(builder: (context) => const RegisterScreen())
                              // );

                        )
                      ],
                    )
                  ],
                )
            )
          ),
        )
      ),
    );
  }
}
