import 'package:flutter/material.dart';
import 'package:popwatch/lists/favourites_list.dart';
import 'package:popwatch/models/movie_show.dart';
import 'package:popwatch/widgets/favourites_gridview.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatelessWidget {
  static String routeName = "/FavouritesScreen";

  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavouritesList favouritesList = Provider.of<FavouritesList>(context);

    return Scaffold(
      body: SingleChildScrollView( //fyi most of the screens uses SingleChildScrolLView so there won't be any yellow bar errors
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Text("  Your Favourites", style: TextStyle(
                    fontSize:20,
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
                endIndent: 10,
                indent: 10,
              ),
              Container(child: (
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Container(height:1000, width: 380, child: FavouritesGridView(favouritesList.getFavouritesList())),],
                //child: FavouritesGridView is to get the Gridview from the widget folder favouritesGridview
              )
              ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
