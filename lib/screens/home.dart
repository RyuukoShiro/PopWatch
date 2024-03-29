import 'package:flutter/material.dart';
import 'package:popwatch/lists/movie_show_list.dart';
import 'package:popwatch/models/movie_show.dart';
import 'package:popwatch/widgets/media_gridview.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  Widget build(BuildContext context) {
    List<MoviesAndShow> movieshowList =
        Provider.of<MovieShowProvider>(context).getMoviesShows();
    //Calls the provider list based on getMoviesShows

    return Consumer<MovieShowProvider>( // calls the consumer to get the data from the provider.
      builder: (context, provider, child) {
        List<MoviesAndShow> moviesList =
            provider.MoviesShowsList.where((element) => element.type == "Movie") // filters the list to only show movies.
                .toList();
        List<MoviesAndShow> showsList =
            provider.MoviesShowsList.where((element) => element.type == "Show") // filters the list to only show shows.
                .toList();
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "    Movies",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(
                    color: Color(0xFFFFCCBC),
                    thickness: 5,
                    height: 5,
                    endIndent: 16,
                    indent: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 220,
                            // Calls the MediaGridView for it to show on the home.dart, and checks for what type of media it is, whether it is a movie or show
                            // If its a movie, the gridview will show only movies.
                            child: moviesList.length == 0 ? SizedBox() : MediaGridView(moviesList), // calls the media grid view.
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "    Shows",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Divider(
                        color: Color(0xFFFFCCBC),
                        thickness: 5,
                        height: 5,
                        endIndent: 16,
                        indent: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 220,
                                child: showsList.length == 0 ? CircularProgressIndicator() : MediaGridView(showsList), // Calls the MediaGridView for it to show on the home.dart, and checks for what type of media it is, whether it is a movie or show
                              ),
                              // Calls the MediaGridView for it to show on the home.dart, and checks for what type of media it is, whether it is a movie or show
                              // If its a show, the gridview will show only shows.
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
