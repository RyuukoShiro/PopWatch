import 'package:flutter/material.dart';
import 'package:popwatch/lists/movie_show_list.dart';
import 'package:popwatch/models/movie_show.dart';
import 'package:popwatch/screens/movieshow_details.dart';
import 'package:popwatch/services/firestore_service.dart';
import 'package:provider/provider.dart';


class MovieShowGridView extends StatelessWidget {

  MovieShowGridView(this.movieshowList, {Key? key, required this.searchController}) : super(key: key);
  List<MoviesAndShow> movieshowList;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {

    String searchString = Provider.of<MovieShowProvider>(context).searchString;
    //Calls the searchString inside the MovieShowList class so that the gridview can allow search for the users.
    // List<MoviesAndShow> movieshowList = Provider.of<MovieShowList>(context).getMoviesShows().where((element) =>
    //     element.title.toLowerCase().contains(searchString)).toList();
    //Call the list on which title the user is currently searching on the search

    return Consumer(
      builder: (context, MovieShowProvider provider, Widget? child) {
        if (searchController.text.isEmpty){
          movieshowList = provider.MoviesShowsList;
        } else {
          movieshowList = provider.MoviesShowsList.where((element) =>
              element.title.toLowerCase().contains(searchController.text.toLowerCase())).toList();
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
                                  child: Text(movieshowList[i].title, style: TextStyle(
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


