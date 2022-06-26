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
        body: Container(
          child: (
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Container(height:580, child: FavouritesGridView(favouritesList.getFavouritesList())),],
              )
          ),
        )
    );
  }
}
