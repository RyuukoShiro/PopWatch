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

class EditComment extends StatefulWidget {
  final String movieTitle;
  //String calls movieTitle from the comments list.
  EditComment({Key? key, required this.movieTitle, required this.comments}) : super(key: key);
  final Comments comments;

  @override
  State<EditComment> createState() => _EditCommentState();
}

class _EditCommentState extends State<EditComment> {

  String? id;
  String? profileicon;
  String? username;
  String? description;


  FirestoreService fsService = FirestoreService();


  void editComments(CommentsListProvider commentsList) {
    bool isValid = formkey.currentState!.validate();
    if (isValid) {
      formkey.currentState!.save();
      if (kDebugMode) {
      }
      if (kDebugMode) {
      }
      fsService.editComment(Comments( //calls the function addComments from the comments_list, and output snackbar when succesfully added.
          id: widget.comments.id,
          movieTitle : widget.movieTitle,
          profileicon : widget.comments.profileicon,
          username : widget.comments.username,
          description: description!));

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Comment is edited!'),
      ));
      Navigator.pop(context);
      formkey.currentState!.reset();
    }
    FocusScope.of(context).unfocus();
  }


  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate(){
    if(formkey.currentState!.validate()){
      print("validated");
    }else{
      print("Not Validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    CommentsListProvider comments = Provider.of<CommentsListProvider>(context); //get the comments list from the provider

    final user = FirebaseAuth.instance.currentUser!; //get the current user from the firebase auth.
    FirestoreService fsService = FirestoreService(); //create a firestore service
    List<Users> currentUser = []; //create a list of users

    return StreamBuilder( //create a stream builder to get the current user from the firebase auth.
      stream: fsService.getCurrentUser(),
      builder: (context, snapshot) {
        return Consumer<CurrentUserProvider>( //get the current user from the provider.
          builder: (BuildContext, provider, Widget? child) {
            currentUser = provider.currentUsers.where((element) => element.email == user.email).toList(); //get the current user from the provider.
            profileicon = currentUser[0].profilepicture; //get the profilepicture from the provider.
            username = currentUser[0].username; // get the username from the provider.

            return Scaffold(
                appBar: AppBar(
                  title: const Text('Edit Comment', textAlign: TextAlign.center,),
                  automaticallyImplyLeading: true,
                  leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context) //go back to the previous page.
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
                                        SizedBox(height: 10,),
                                        CircleAvatar(
                                          radius: 68,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            radius: 65,
                                            backgroundImage: NetworkImage(currentUser[0].profilepicture), //get the profilepicture from the provider and ouput the values into the networkimage
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        Text('Editing Comment',
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
                                                initialValue: currentUser[0].username,
                                                validator: MultiValidator([
                                                  RequiredValidator(errorText: "* Required"),
                                                ]
                                                ),
                                                enabled: false,
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
                                                  description = value as String; //get the value from the textfield and save it into the description variable.
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
                                                  Text("Edit Comment",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18,
                                                    ),),
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              if (formkey.currentState!.validate()){ //if the form is valid.
                                                editComments(comments);
                                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                  content: Text('Comment is edited!'),
                                                ));
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