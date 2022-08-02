import 'package:flutter/material.dart';
import 'package:popwatch/details/media_body.dart';
import 'package:popwatch/models/movie_show.dart';
import 'package:popwatch/screens/home.dart';

class MovieShowDetails extends StatelessWidget {
  final String routeName = '/movies';

  const MovieShowDetails({Key? key, required this.movieshowDisplay}) : super(key: key);
  final MoviesAndShow movieshowDisplay;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieshowDisplay.title),
        automaticallyImplyLeading: true,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context))
      ),
      body: SingleChildScrollView(
        child: MovieShowBody(movieshowDisplay: movieshowDisplay),
      )
    );
  }
  //Calls goToDetails so that everypage that contains a movie or show, is able to call the function and get to the MovieShowDetails Page
  static void goToDetails(BuildContext context, MoviesAndShow movieshowDisplay){
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => MovieShowDetails(movieshowDisplay: movieshowDisplay)),
    );
  }
}


