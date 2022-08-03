import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:popwatch/lists/movie_show_list.dart';
import 'package:popwatch/models/movie_show.dart';
import 'package:popwatch/services/firestore_service.dart';
import 'package:provider/provider.dart';
import '../screens/movieshow_details.dart';

class MediaGridView extends StatelessWidget {
  MediaGridView(this.movieshowList, {Key? key}) : super(key: key);
  List<MoviesAndShow> movieshowList;
// Calls the list movieshowlist
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: GridView.builder(
        itemBuilder: (ctx, i) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: GridTile(
              child: GestureDetector(
                onTap: () {
                  MovieShowDetails.goToDetails(context, movieshowList[i]);
                  //onTap method is used to check what current index is the movie/show the user is currently pressing
                },
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      child: Image.network(
                        movieshowList[i].poster,
                        fit: BoxFit.fitHeight,
                      ),

                      //Shows the poster for each movie and show based on their index
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: movieshowList.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (125 / 100),
          crossAxisCount: 1,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 5.0,
        ),
        physics: ScrollPhysics(),
      ),
    );
  }
}
