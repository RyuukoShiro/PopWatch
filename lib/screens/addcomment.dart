
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:popwatch/lists/comments_list.dart';
import 'package:popwatch/models/commets.dart';
import 'package:provider/provider.dart';

class AddComment extends StatefulWidget {
  AddComment(this.commentsList, {Key? key}) : super(key: key);
  List<Comments> commentsList;

  @override
  State<AddComment> createState() => _AddCommentState();
}

GlobalKey<FormState> formkey = GlobalKey<FormState>();

class _AddCommentState extends State<AddComment> {

  String? profileicon;
  String? username;
  String? description;

  void addComments(CommentsList commentsList) {
    bool isValid = formkey.currentState!.validate();
    if (isValid) {
      formkey.currentState!.save();
      if (kDebugMode) {
      }
      if (kDebugMode) {
      }
      commentsList.addComments(profileicon, username, description);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Comment is added!'),
      ));
      Navigator.pop(context);
      formkey.currentState!.reset();
    }
    FocusScope.of(context).unfocus();
  }


  void validate(){
    if(formkey.currentState!.validate()){
      print("validated");
    }else{
      print("Not Validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    CommentsList commentsList = Provider.of<CommentsList>(context);

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
                          child: TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(errorText: "* Required"),
                            ]
                            ),
                            onSaved:(value){
                              profileicon = value as String;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: 'User Icon (image Url Link)',
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
                              username = value as String;
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
                              description = value as String;
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
                          if (formkey.currentState!.validate()){
                            addComments(commentsList);
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
}
