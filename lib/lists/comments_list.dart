import 'package:flutter/material.dart';
import 'package:popwatch/models/commets.dart';

class CommentsList with ChangeNotifier{

  List<Comments> commentsList = [
  ];

  void addComments(profileicon, username, description) {
    commentsList.insert(0,
        Comments(
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

  List<Comments>  getComments(){
    return commentsList;
  }

}