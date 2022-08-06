import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:popwatch/models/comments.dart';

class CommentsListProvider with ChangeNotifier{

  List<Comments> commentsList = [];


  // Function to add the comments, movieTitle gets the current movie that you are currently viewing
  // and profileicon, username and description to add the data into the list.
  void addComments(id, movieTitle, profileicon, username, description) {
    commentsList.insert(0,
        Comments(
          id: id,
          movieTitle: movieTitle,
          profileicon: profileicon,
          username: username,
          description: description,
        ));
    notifyListeners();
  }
 // Function to remove the comments.
  void deleteComment(i){ // Delete function which calls the current index of the selected comment and delete it
    commentsList.removeAt(i);
    notifyListeners();
  }
  // Function to get the commentsList and to edit the current comments by username
  void editComment(Comments comments){ // Edit function which calls the current index by username and editing it.
    commentsList[commentsList.indexWhere((element) => element.username == comments.username)] = comments;
    notifyListeners();
  }

  // Function to get the commentsList
  List<Comments>  getComments(){ // To get the list and return it
    return commentsList;
  }

  //Calls the provider from the comments_list.dart and get the comments from the firestore.
  CommentsListProvider(){
    FirebaseFirestore.instance.collection('comments').snapshots().listen((event){
      for (var change in event.docChanges){
        Comments comments = Comments.fromMap(change.doc.data()!, change.doc.id);
        switch (change.type){
          case DocumentChangeType.added:
            commentsList.add(comments);
            break;
          case DocumentChangeType.modified:
            commentsList.removeWhere((element) => element.id == comments.id);
            commentsList.add(comments);
            break;
          case DocumentChangeType.removed:
            commentsList.removeWhere((element) => element.id == comments.id);
            break;
        }
      }
    });
  }

}