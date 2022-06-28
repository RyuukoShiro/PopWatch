import 'package:flutter/material.dart';
import 'package:popwatch/lists/movie_show_list.dart';
import 'package:popwatch/models/movie_show.dart';
import 'package:popwatch/widgets/media_gridview.dart';
import 'package:popwatch/widgets/movie_show_gridview.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  static String routeName = "/ListScreen";
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  @override
  Widget build(BuildContext context) {

    MovieShowList movieshowList = Provider.of<MovieShowList>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                onChanged: (value){
                  setState((){
                    movieshowList.searchString = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Container(
              child: (
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Container(height:500, child: MovieShowGridView(movieshowList.getMoviesShows())
                    ),],
                  )
              ),
            ),
          ],
        ),
      )
    );
  }
}


