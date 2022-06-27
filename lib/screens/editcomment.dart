import 'package:flutter/material.dart';
import 'package:popwatch/models/commets.dart';

class EditComment extends StatelessWidget {
  EditComment(this.commentsList, {Key? key}) : super(key: key);
  List<Comments> commentsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Comment', textAlign: TextAlign.center,),
          automaticallyImplyLeading: true,
          leading: IconButton(icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)
          ),
        ),
        backgroundColor: Color(0xFFFFCCBC),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/popcorn.png',
                      height: 200.0,
                      width: 225.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: "Description"
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

                        }
                    ),
                  ],
                )
            ),
          ),
        )
    );
  }
}