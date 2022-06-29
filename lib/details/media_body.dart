import 'package:flutter/material.dart';
import 'package:popwatch/lists/comments_list.dart';
import 'package:popwatch/models/movie_show.dart';
import 'package:popwatch/screens/addcomment.dart';
import 'package:popwatch/widgets/comments_listview.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:popwatch/lists/favourites_list.dart';

class MovieShowBody extends StatefulWidget {

  final MoviesAndShow movieshowDisplay;
  const MovieShowBody({Key? key, required this.movieshowDisplay}) : super(key: key);


  @override
  State<MovieShowBody> createState() => _MovieShowBodyState();

  //Calls the gotoMovieDetails so that when it is an movie or show is called it will transport the user
  // to the moviedetails page with the current index
  static void goToMovieDetails(BuildContext context, MoviesAndShow movieshowDisplay){
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => MovieShowBody(movieshowDisplay: movieshowDisplay)),
    );
  }

}

class _MovieShowBodyState extends State<MovieShowBody> {
  String changeText = "Favourites";
  Widget build(BuildContext context) {

    CommentsList commentsList = Provider.of<CommentsList>(context);

    Size size = MediaQuery.of(context).size;
    //Calls the favouritelist provider from FavouritesList
     FavouritesList favouritesList = Provider.of<FavouritesList>(context);
     //Checks whether if the current element has existing movie or show
    //if not it will be added to the favouriteslist. But if there is already a existing movie or show inside
    //it allows the users to unfavourite it, to call the deleteFavourites function to remove it from the list
    if(favouritesList.getFavouritesList().every((element) =>
    element.title != widget.movieshowDisplay.title)){
      changeText = "Favourites";
    }else{
      changeText = "Unfavourites";
    }

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular((8)))),
                child: InkWell(
                    child: Column(children: <Widget>[
                      ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),),
                        child: Align(alignment: Alignment.center,
                          child: Image.network(widget.movieshowDisplay.cover, height: 200, width: 300, fit:BoxFit.cover
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(widget.movieshowDisplay.title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Column(
                          children: [
                            Text(widget.movieshowDisplay.runtime),
                            Text(widget.movieshowDisplay.company),
                            Text(widget.movieshowDisplay.genre)],
                        ),
                      )
                    ],
                    )
                )
            ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFFFCCBC),
                          ),
                          icon: Icon(
                            Icons.favorite,
                            size: 24.0,
                          ),
                          label: Text(changeText),
                          onPressed: () {
                            //onPressed method to check whether if the current state has any existing movie or show
                            //Checks whether if the current element has existing movie or show
                            //if not it will be added to the favouriteslist. But if there is already a existing movie or show inside
                            //it allows the users to unfavourite it, to call the deleteFavourites function to remove it from the list
                            if (favouritesList.getFavouritesList().every((element) =>
                            element.title != widget.movieshowDisplay.title))
                            {
                              changeText = "Unfavourite";
                              setState((){
                                Text(changeText);
                              });
                              favouritesList.addToFavourites(widget.movieshowDisplay);
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('Added to favourites!'),
                              ));
                            }else{
                              favouritesList.deleteFavourite(widget.movieshowDisplay);
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('Unfavourited!'),
                              ));
                            }
                          },
                        ),

                          SizedBox.fromSize(
                            size: Size(50, 50),
                            child: ClipOval(
                              child: Material(
                                color: const Color(0xFFFFCCBC),
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text('Copied to clipboard for sharing!'),
                                    ));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.share, color: const Color(0xFFFFFFFF)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                    )
                  ],
                ),
              ),
              Container(
                child: Text("Trailer",style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
              ),
              Card(
                child: Container(
                  margin: EdgeInsets.all(8),
                  // YoutubePlayerController will call the youtube link from the selected movieshowDisplay.trailer.
                  // if called successfully video will be outputted onto the details page
                  child: YoutubePlayer(controller: YoutubePlayerController(
                      initialVideoId: YoutubePlayer.convertUrlToId(widget.movieshowDisplay.trailer)!,
                    flags: YoutubePlayerFlags(
                      autoPlay: false,
                      mute: false,
                      isLive: false,
                    )),
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: const Color(0xFFFFCCBC),
                    progressColors: ProgressBarColors(
                      playedColor: const Color(0xFFFFCCBC),
                      handleColor: const Color(0xFFFFAB91)
                    ),
                  ),
                  ),
                ),
              Card(
                  child: ListTile(
                    title: Text("Description"),
                    subtitle: Text(widget.movieshowDisplay.description),
                  ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFFFCCBC),
                        ),
                        icon: Icon(
                          Icons.edit,
                          size: 24.0,
                        ),
                        label: Text("Add comment"),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => AddComment(commentsList: commentsList.getComments(), movieTitle: widget.movieshowDisplay.title ))
                          );
                        },
                      )],
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(height:300, child: CommentsListView(movieTitle: widget.movieshowDisplay.title,)),
                  ],
                ),
              ),
            ],
          )
          )
      ]
    );
  }
}

