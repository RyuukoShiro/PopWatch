import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:popwatch/models/movie_show.dart';

class FavouritesListProvider with ChangeNotifier{


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

  List<MoviesAndShow> favouritesList =[];


  FavouritesListProvider(){
    FirebaseFirestore.instance.collection('favourites').snapshots().listen((event){
      for (var change in event.docChanges){
        MoviesAndShow moviesAndShow = MoviesAndShow.fromMap(change.doc.data()!, change.doc.id);
        switch (change.type){
          case DocumentChangeType.added:
            favouritesList.add(moviesAndShow);
            break;
          case DocumentChangeType.modified:
            favouritesList.removeWhere((element) => element.id == moviesAndShow.id);
            favouritesList.add(moviesAndShow);
            break;
          case DocumentChangeType.removed:
            favouritesList.removeWhere((element) => element.id == moviesAndShow.id);
            break;
        }
      }
    });
  }

}