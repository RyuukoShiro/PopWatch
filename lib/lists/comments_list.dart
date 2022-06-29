import 'package:flutter/material.dart';
import 'package:popwatch/models/comments.dart';

class CommentsList with ChangeNotifier{

  List<Comments> commentsList = [];

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

  void deleteComment(i){
    commentsList.removeAt(i);
    notifyListeners();
  }

  void editComment(Comments comments){
    commentsList[commentsList.indexWhere((element) => element.username == comments.username)] = comments;
    notifyListeners();
  }

  List<Comments>  getComments(){
    return commentsList;
  }

}