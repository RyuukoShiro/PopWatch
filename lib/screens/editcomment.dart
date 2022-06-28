import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:popwatch/models/commets.dart';

class EditComment extends StatelessWidget {
  EditComment(this.commentsList, {Key? key}) : super(key: key);
  List<Comments> commentsList;

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