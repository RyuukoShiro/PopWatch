import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:popwatch/main_with_user.dart';
import 'package:popwatch/screens/signin_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController password = TextEditingController(); // TextEditingController is used to compare between the password and confirm password when printed out
  final TextEditingController confirmPassword = TextEditingController();

  // check if there is any values in the validation
  void validate(){
    if(formkey.currentState!.validate()){
      print("validated");
    }else{
      print("Not Validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register', textAlign: TextAlign.center,),
        automaticallyImplyLeading: true,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)
        ),
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
                    height: 100.0,
                    width: 125.0,
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      child: TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Required"),
                        ]),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: 'Username',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      child: TextFormField(
                        // Validator is used to check if there is any values within the TextFormField
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Required"),
                        ]),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: 'First Name',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      child: TextFormField(
                        // Validator is used to check if there is any values within the TextFormField
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Required"),
                        ]),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: 'Last Name',
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
                            // For EmailValidator is able to check whether it is a valid email or not with it is checking the @ and the .com
                            RequiredValidator(errorText: "* Required"),
                            EmailValidator(errorText: "Enter valid email id"),
                          ]
                          ),
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
                          controller: password,
                          keyboardType: TextInputType.text,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                            MinLengthValidator(6,
                                errorText: "Password should be atleast 6 characters"),
                            MaxLengthValidator(15,
                                errorText:
                                "Password should not be greater than 15 characters")
                          ]),
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
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: TextFormField(
                          controller: confirmPassword,
                          keyboardType: TextInputType.text,
                          validator: (value){
                            //Validator calls the TextEditingController and print out both passwords to compare with eachother
                            //If it fails it will return as "Password Does not Match"
                            if(value!.isEmpty)
                            {
                              return 'Please re-enter password';
                            }
                            print(password.text);
                            print(confirmPassword.text);
                            if(password.text!=confirmPassword.text){
                              return "Password does not match";
                            }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Confirm Password',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFAB91),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child:
                            Text("Register",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),),
                          ),
                        ),
                      ),
                      onTap: () {
                        //formkey checks whether if there is any values currently in the TextFormView
                        // if so will be routed to the MainScreenWithUser
                        if (formkey.currentState!.validate()){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => MainScreenWithUser())
                          );
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('Registered!'),
                          ));
                        }
                      }
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member? ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                          child:
                          Text(
                            'Sign In now!',
                            style: TextStyle(
                              color: Color(0xFFFFAB91),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap:(){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SignInScreen())
                            );
                          }
                      )
                    ],
                  ),
                ],
              ),
            )
          )
        )
      )

    );
  }
}
