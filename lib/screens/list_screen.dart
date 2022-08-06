import 'package:flutter/material.dart';
import 'package:popwatch/lists/movie_show_list.dart';
import 'package:popwatch/widgets/movie_show_gridview.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  static String routeName = "/ListScreen";
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  TextEditingController searchList = TextEditingController(); // creates a text editing controller.
  @override
  Widget build(BuildContext context) {

    MovieShowProvider movieshowList = Provider.of<MovieShowProvider>(context);
    //Calls the provider for movieshowList based on context
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(padding: const EdgeInsets.symmetric(horizontal:15.0),
            child: TextField(
              controller: searchList,
              onChanged: (value){
                setState((){
                  movieshowList.searchText = value.toLowerCase(); //Calls the searchText in movieshowList
                });
              },
              decoration: InputDecoration(
                hintText: "Search",
                suffixIcon: Icon(Icons.search),
              ),
            ),
            ),
            SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text("  Discover", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Divider(
                      color: Color(0xFFFFCCBC),
                      thickness: 5,
                      height: 5,
                      endIndent: 10,
                      indent: 10,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Container(height:580, width: 380, child: MovieShowGridView(movieshowList.getMoviesShows(), searchList: searchList,))], // calls the movie show grid view.
                        //child: MovieShowGridview calls the gridview from the dart flower to display the gridview
                      )
                    )
                  ],
                )
              ),
            )
          ],
        ),
      )
    );
  }
}


