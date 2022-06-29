import 'package:flutter/material.dart';
import 'package:popwatch/models/comments.dart';

class CommentsList with ChangeNotifier{

  List<Comments> commentsList = [];


  // Function to add the comments, movieTitle gets the current movie that you are currently viewing
  // and profileicon, username and description to add the data into the list.
  void addComments(movieTitle, profileicon, username, description) {
    commentsList.insert(0,
        Comments(
          movieTitle: movieTitle,
          profileicon: profileicon,
          username: username,
          description: description,
        ));
    notifyListeners();
  }

  void deleteComment(i){ // Delete function which calls the current index of the selected comment and delete it
    commentsList.removeAt(i);
    notifyListeners();
  }

  void editComment(Comments comments){ // Edit function which calls the current index by username and editing it.
    commentsList[commentsList.indexWhere((element) => element.username == comments.username)] = comments;
    notifyListeners();
  }

  List<Comments>  getComments(){ // To get the list and return it
    return commentsList;
  }

}