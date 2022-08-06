import 'package:flutter/material.dart';
import 'package:popwatch/lists/movie_show_list.dart';
import 'package:popwatch/models/movie_show.dart';
import 'package:popwatch/screens/movieshow_details.dart';
import 'package:popwatch/services/firestore_service.dart';
import 'package:provider/provider.dart';


class MovieShowGridView extends StatelessWidget {

  MovieShowGridView(this.movieshowList, {Key? key, required this.searchList}) : super(key: key);
  List<MoviesAndShow> movieshowList; // Calls the list movieshowlist
  final TextEditingController searchList; // calls the searchList function.

  @override
  Widget build(BuildContext context) {

    String searchText = Provider.of<MovieShowProvider>(context).searchText;
    //Calls the searchText inside the MovieShowList class so that the gridview can allow search for the users.

    return Consumer( // Calls the MovieShowProvider class.
      builder: (context, MovieShowProvider provider, Widget? child) {
        if (searchList.text.isEmpty){ // if the searchList is empty, then go to the MovieShowList class.
          movieshowList = provider.MoviesShowsList; // calls the MoviesShowsList function.
        } else {
          movieshowList = provider.MoviesShowsList.where((element) => // if the searchList is not empty, then go to the MovieShowList class.
              element.title.toLowerCase().contains(searchList.text.toLowerCase())).toList(); // calls the MoviesShowsList function.
        }

        return Container(
          margin: EdgeInsets.only(top: 30),
          child:
          GridView.builder(itemBuilder: (ctx, i) {
            return ClipRRect
              (borderRadius: BorderRadius.circular(12.0),
                child: GridTile(child: GestureDetector
                  (onTap: (){MovieShowDetails.goToDetails(context, movieshowList[i]);
                  //onTap method is used to check what current index is the movie/show the user is currently pressing
                },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 200,
                            child: Image.network(movieshowList[i].poster, fit: BoxFit.fitHeight)),
                        //Shows the poster for each movie and show based on their index
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFAB91),
                              ),
                              child: Center(
                                  child: Text(movieshowList[i].title, style: TextStyle( //Shows the title for each movie and show based on their index
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ))
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                )
            );},
            itemCount: movieshowList.length,
            gridDelegate: const
            SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (75 / 100),
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 5.0,
            ),
            physics: ScrollPhysics(),
          ),
        );
      }
    );

  }
}


