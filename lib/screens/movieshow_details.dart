import 'package:flutter/material.dart';
import 'package:popwatch/details/media_body.dart';
import 'package:popwatch/models/movie_show.dart';

class MovieShowDetails extends StatelessWidget {
  final String routeName = '/movies';

  const MovieShowDetails({Key? key, required this.movieshowDisplay}) : super(key: key);
  final MoviesAndShow movieshowDisplay; // calls the movieshow display.

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieshowDisplay.title), // displays the title of the movie show.
        automaticallyImplyLeading: true,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)) // go back to the previous screen.
      ),
      body: SingleChildScrollView(
        child: MovieShowBody(movieshowDisplay: movieshowDisplay), // get the movie show body.
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


