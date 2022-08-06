
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:popwatch/lists/comments_list.dart';
import 'package:popwatch/lists/user_list.dart';
import 'package:popwatch/models/comments.dart';
import 'package:popwatch/models/users.dart';
import 'package:popwatch/services/firestore_service.dart';
import 'package:provider/provider.dart';

class AddComment extends StatefulWidget {
  List<Comments> commentsList;
  final String movieTitle;
  //String calls movieTitle from the comments list.

  AddComment({Key? key, required this.movieTitle, required this.commentsList}) : super(key: key);

  @override
  State<AddComment> createState() => _AddCommentState();
}
GlobalKey<FormState> formkey = GlobalKey<FormState>();

class _AddCommentState extends State<AddComment> {

  String? id;
  String? profileicon;
  String? username;
  String? description;

  FirestoreService fsService = FirestoreService();

  // function addComments check if the formkey has validation or not.
  void addComments(CommentsListProvider commentsList) {
    bool isValid = formkey.currentState!.validate();
    if (isValid) {
      formkey.currentState!.save();
      if (kDebugMode) {
      }
      if (kDebugMode) {
      }
      //calls the function addComments from the comments_list, and output snackbar when succesfully added.
      fsService.addComment(widget.movieTitle, profileicon, username, description);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Comment is added!'),
      ));
      Navigator.pop(context);
      formkey.currentState!.reset();
    }
    FocusScope.of(context).unfocus();
  }

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
    CommentsListProvider commentsList = Provider.of<CommentsListProvider>(context);


    final user = FirebaseAuth.instance.currentUser!;
    // get the current user from the firebase auth.
    FirestoreService fsService = FirestoreService();
    // get the firestore service.

    List<Users> currentUser = [];

    return StreamBuilder(
      stream: fsService.getCurrentUser(),
      // get the current user from the firestore.
      builder: (context, snapshot) {
        return Consumer<CurrentUserProvider>(
          // get the current user from the provider.
          builder: (BuildContext context, provider, Widget? child) {
            currentUser = provider.currentUsers.where((element) => element.email == user.email).toList();
            // get the current user from the provider.
            profileicon = currentUser[0].profilepicture;
            // get the profilepicture from the provider.
            username = currentUser[0].username;
            // get the username from the provider.

            return Scaffold(
              appBar: AppBar(
                title: const Text("Add Comment", textAlign: TextAlign.center,),
                automaticallyImplyLeading: true,
                leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)
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
                            Image.asset('assets/images/popcorn.png',
                              height: 100.0,
                              width: 125.0,
                            ),
                            SizedBox(height: 15),
                            Text('Please type in your comments',
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
                                  child:  CircleAvatar(
                                      radius: 62,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        radius: 60,
                                        backgroundImage: NetworkImage(currentUser[0].profilepicture),
                                        // get the profilepicture from the provider and calls it in the networkimage by currentuser.
                                      )
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 0.0),
                                  child: TextFormField(
                                    validator: MultiValidator([
                                      RequiredValidator(errorText: "* Required"),
                                    ],
                                    ),
                                    enabled: false,
                                    initialValue: username,
                                    onSaved:(value){
                                      username = currentUser[0].username; // TextFormField call for username
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      hintText: 'Username',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 0.0),
                                  child: TextFormField(
                                    validator: MultiValidator([
                                      RequiredValidator(errorText: "* Required"),
                                    ]
                                    ),
                                    onSaved:(value){
                                      description = value as String;// TextFormField call for description
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      hintText: 'Description',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
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
                                      Text("Add Comment",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  if (formkey.currentState!.validate()){ //Checks if all values are in the TextFormField if so, call function addComments to add to the list
                                    addComments(commentsList);
                                    // add the comments to the list.
                                  }
                                  else{

                                  }
                                }
                            ),
                          ],
                        )
                      )
                    )
                  )
                )
              )
            );
          }
        );
      }
    );
  }
}
