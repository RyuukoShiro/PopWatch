import 'package:flutter/material.dart';
import 'package:popwatch/lists/movie_show_list.dart';
import 'package:popwatch/models/movie_show.dart';
import 'package:popwatch/screens/movieshow_details.dart';
import 'package:provider/provider.dart';


class MovieShowGridView extends StatelessWidget {

  MovieShowGridView(this.movieshowList,  {Key? key}) : super(key: key);
  List <MoviesAndShow> movieshowList;

  @override
  Widget build(BuildContext context) {

    String searchString = Provider.of<MovieShowList>(context).searchString;
    List<MoviesAndShow> movieshowList = Provider.of<MovieShowList>(context).getMoviesShows().where((element) =>
        element.title.toLowerCase().contains(searchString)).toList();

    return Container(
      margin: EdgeInsets.only(top: 30),
      child:
          GridView.builder(itemBuilder: (ctx, i) {
            return ClipRRect
          (borderRadius: BorderRadius.circular(30.0),
            child: GridTile(child: GestureDetector
              (onTap: (){MovieShowDetails.goToDetails(context, movieshowList[i]);
            },
              child: Image.network(movieshowList[i].poster),
            ),
            )
          );},
          itemCount: movieshowList.length,
          gridDelegate: const
          SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (120 / 120),
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 5.0,
          ),
          physics: ScrollPhysics(),
          ),
    );
  }
}

