import 'package:flutter/material.dart';
import 'package:popwatch/models/movie_show.dart';
import '../screens/movie_details.dart';

class MediaGridView extends StatelessWidget {


  MediaGridView(this.movieshowList, {Key? key}) : super(key: key);
  List <MoviesAndShow> movieshowList;

  @override
  Widget build(BuildContext context) {


    return Container(
      margin: EdgeInsets.only(top: 30),
      child:
      GridView.builder(itemBuilder: (ctx, i)
      {return ClipRRect
        (borderRadius: BorderRadius.circular(5.0),
          child: GridTile(child: GestureDetector
            (onTap: (){MovieShowDetails.goToDetails(context, movieshowList[i]);
          },
            child: Image.network(movieshowList[i].poster,),
          ),
          )
      );},
        itemCount: movieshowList.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: const
        SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (100 / 100),
          crossAxisCount: 1,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        physics: ScrollPhysics(),
      ),
    );
  }
}


