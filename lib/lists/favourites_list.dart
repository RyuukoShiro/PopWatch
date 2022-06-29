import 'package:flutter/material.dart';
import 'package:popwatch/models/movie_show.dart';

class FavouritesList with ChangeNotifier{
  List<MoviesAndShow> favouritesList =[];

  List<MoviesAndShow> getFavouritesList(){ // gets the list from MoviesAndShow for favouriteslist
    return favouritesList;
  }

  //Gets the list from moviesandshow and add it to the list
  void addToFavourites(MoviesAndShow moviesAndShow){
    favouritesList.insert(0, moviesAndShow);
    notifyListeners();
  }

  //Function allows user to remove favourites from the list
  void deleteFavourite(MoviesAndShow moviesAndShow){
    favouritesList.remove(moviesAndShow);
    notifyListeners();
  }

}