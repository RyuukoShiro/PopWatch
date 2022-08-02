import 'package:flutter/material.dart';
import 'package:popwatch/lists/favourites_list.dart';
import 'package:popwatch/lists/movie_show_list.dart';
import 'package:popwatch/models/movie_show.dart';
import 'package:popwatch/screens/movieshow_details.dart';
import 'package:provider/provider.dart';

class FavouritesGridView extends StatelessWidget {


  FavouritesGridView(this.movieshowList, {Key? key}) : super(key: key);
  List <MoviesAndShow> movieshowList;


  @override
  Widget build(BuildContext context) {
    //Calls the provider for favouriteslist as well as movieshowlist
    FavouritesList favouritesList = Provider.of<FavouritesList>(context);
    MovieShowProvider movieShowList = Provider.of<MovieShowProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: 15),
      child:
      GridView.builder(itemBuilder: (ctx, i) {
        return ClipRRect
          (borderRadius: BorderRadius.circular(0.0),
            child: GridTile(child: GestureDetector
              (onTap: (){MovieShowDetails.goToDetails(context, movieshowList[i]);
                //onTap method is used to check what current index is the movie/show the user is currently pressing
            },
              child: Container(height: 200,
                  child: Card(child: Image.network(movieshowList[i].poster, fit: BoxFit.cover))),
              //Shows the poster for each movie and show based on their index
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
}
