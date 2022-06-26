import 'package:flutter/material.dart';
import 'package:popwatch/models/movie_show.dart';

class FavouritesList with ChangeNotifier{
  List<MoviesAndShow> favouritesList =[];

  List<MoviesAndShow> getFavouritesList(){
    return favouritesList;
  }

  void addToFavourites(MoviesAndShow moviesAndShow){
    favouritesList.insert(0, moviesAndShow);
    notifyListeners();
  }

  void deleteFavourite(MoviesAndShow moviesAndShow){
    favouritesList.remove(moviesAndShow);
    notifyListeners();
  }

}