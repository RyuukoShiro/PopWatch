import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:popwatch/lists/comments_list.dart';
import 'package:popwatch/models/comments.dart';
import 'package:provider/provider.dart';

class EditComment extends StatefulWidget {
  final String movieTitle;
  EditComment({Key? key, required this.movieTitle, required this.comments}) : super(key: key);
  final Comments comments;

  @override
  State<EditComment> createState() => _EditCommentState();
}

class _EditCommentState extends State<EditComment> {

  String? profileicon;
  String? username;
  String? description;

  void editComments(CommentsList commentsList) {
    bool isValid = formkey.currentState!.validate();
    if (isValid) {
      formkey.currentState!.save();
      if (kDebugMode) {
      }
      if (kDebugMode) {
      }
      commentsList.editComment(Comments(movieTitle : widget.movieTitle, profileicon : widget.comments.profileicon, username : widget.comments.username, description: description!));
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
    CommentsList comments = Provider.of<CommentsList>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Comment', textAlign: TextAlign.center,),
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
                                        initialValue: widget.comments.profileicon,
                                        validator: MultiValidator([
                                          RequiredValidator(errorText: "* Required"),
                                        ]
                                        ),
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
                                        initialValue: widget.comments.username,
                                        validator: MultiValidator([
                                          RequiredValidator(errorText: "* Required"),
                                        ]
                                        ),
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
                                      if (formkey.currentState!.validate()){
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
}