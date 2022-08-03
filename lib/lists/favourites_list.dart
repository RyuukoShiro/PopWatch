import 'package:cloud_firestore/cloud_firestore.dart';
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

  // FavouritesListProvider(){
  //   FirebaseFirestore.instance.collection('favourites').snapshots().listen(
  //       (event){
  //         for (var change in event.docChanges){
  //           MoviesAndShow movieshow =
  //               MoviesAndShow.fromMap(change.doc.data()!, change.doc.id);
  //           switch (change.type) {
  //             case DocumentChangeType.added:
  //               favouritesList.add(movieshow);
  //               break;
  //             case DocumentChangeType.modified:
  //               favouritesList.remove(movieshow);
  //               favouritesList.add(movieshow);
  //               break;
  //             case DocumentChangeType.removed:
  //               favouritesList.remove(movieshow);
  //               break;
  //           }
  //           notifyListeners();
  //         }
  //       }
  //   );
  // }

}