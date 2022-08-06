import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:popwatch/lists/user_list.dart';
import 'package:popwatch/models/users.dart';
import 'package:popwatch/services/firestore_service.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key, required this.users}) : super(key: key);
  final Users users;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

FirestoreService fsService = FirestoreService();



class _EditProfileScreenState extends State<EditProfileScreen> {
  String? id;
  String? profilepicture;
  String? username;
  String? firstname;
  String? lastname;
  String? email;


  void editProfiles(CurrentUserProvider currentUsers) {
    bool isValid = formkey.currentState!.validate();
    if (isValid) {
      formkey.currentState!.save();
      if (kDebugMode) {
      }
      if (kDebugMode) {
      }
      fsService.editProfile(Users( // calls the function editProfile from the firestore_service.dart, and output snackbar when succesfully added.
          id: widget.users.id,
          profilepicture : profilepicture!,
          username : username!,
          firstname : firstname!,
          lastname : lastname!,
          email : widget.users.email,
          password : widget.users.password));

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Profile is edited!'),
      ));
      Navigator.pop(context);
      formkey.currentState!.reset();
    }
    FocusScope.of(context).unfocus();
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate(){ // check if there is any values in the validation
    if(formkey.currentState!.validate()){
      print("validated");
    }else{
      print("Not Validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    CurrentUserProvider currentUsers = Provider.of<CurrentUserProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile', textAlign: TextAlign.center,),
          automaticallyImplyLeading: true,
          leading: IconButton(icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)
          ),
        ),
        backgroundColor: Color(0xFFFFCCBC),
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 15),
                      CircleAvatar(
                        radius: 72,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(widget.users.profilepicture),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          child: TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(errorText: "* Required"),
                            ]),
                            onSaved:(value){
                              profilepicture = value as String; // set the value to the profilepicture
                            },
                            initialValue: widget.users.profilepicture,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: 'Profile Picture (URL)',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          child: TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(errorText: "* Required"),
                            ]),
                            onSaved:(value){
                              username = value as String; // set the value to the username
                            },
                            initialValue: widget.users.username,
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
                            onSaved:(value){
                              firstname = value as String; // set the value to the firstname
                            },
                            initialValue: widget.users.firstname,
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
                            onSaved:(value){
                              lastname = value as String; // set the value to the lastname
                            },
                            initialValue: widget.users.lastname,
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
                              onSaved:(value){
                                email = value as String; // set the value to the email
                              },
                              enabled: false,
                              initialValue: widget.users.email,
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
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFAB91),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child:
                                Text("Edit Profile",
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
                              editProfiles(currentUsers);
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('Registered!'),
                              ));
                            }
                          }
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}