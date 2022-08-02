import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:popwatch/lists/movie_show_list.dart';
import 'package:provider/provider.dart';

class AddMovieShow extends StatefulWidget {
  const AddMovieShow({Key? key}) : super(key: key);

  @override
  State<AddMovieShow> createState() => _AddMovieShowState();
}

class _AddMovieShowState extends State<AddMovieShow> {
  // Creates a globalkey for formkey to check for validation
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String? id;
  String? title;
  String? description;
  String? runtime;
  String? company;
  String? genre;
  String? trailer;
  String? poster;
  String? cover;
  String? type;

  // Calls addMoviesShows from the movie_show_list and checks whether if theres is values.
  void addMoviesShows(MovieShowProvider movieshowList) {
    bool isValid = formkey.currentState!.validate();
    if (isValid) {
      formkey.currentState!.save();
      if (kDebugMode) {
      }
      if (kDebugMode) {
      }
      //calls the function addComments from the movieshowList, and output snackbar when succesfully added.
      movieshowList.addMoviesShows(id, title, description, runtime, company,
          genre, trailer, poster, cover, type);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Movies/Show is added!'),
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
    MovieShowProvider movieshowList = Provider.of<MovieShowProvider>(context);
    // Calls the provider of MovieShowList

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Movie', textAlign: TextAlign.center,),
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
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                          ]
                          ),
                          onSaved:(value){
                            title = value as String;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Name of Movie/Show',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,),
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
                            hintText: 'Movie/Show Description',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                          ]
                          ),
                          onSaved:(value){
                            runtime = value as String;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Movie/Show Runtime',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                          ]
                          ),
                          onSaved:(value){
                            company = value as String;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Movie/Show Company',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                          ]
                          ),
                          onSaved:(value){
                            genre = value as String;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Movie/Show Genre',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                          ]
                          ),
                          onSaved:(value){
                            trailer = value as String;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Movie/Show Trailer (Youtube Link)',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                          ]
                          ),
                          onSaved:(value){
                            poster = value as String;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Movie/Show Poster (image url)',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                          ]
                          ),
                          onSaved:(value){
                            cover = value as String;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Movie/Show Cover (image url)',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                          ]
                          ),
                          onSaved:(value){
                            type = value as String;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Is it a Movie or Show?',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
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
                Text("Add Movie",
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
                //formkey checks whether if there is any validation values in the TextFormField if have values
                // function addMoviesShows will be done, values entered will be sent to the list and outputted to the gridview.
                addMoviesShows(movieshowList);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Successfully added!'),
                ));
              }
              else{

              }

            }
        ),
                  SizedBox(height: 30),

                ],
              )
            )
          )
        ),
      )
    );
  }
}
