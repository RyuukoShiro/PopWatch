import 'package:flutter/material.dart';
import 'package:popwatch/models/commets.dart';

class CommentsList with ChangeNotifier{

  List<Comments> commentsList = [
    Comments(profileicon: "https://preview.redd.it/huk3e99dlat81.png?width=640&crop=smart&auto=webp&s=76621589c1cb2faceca91a4a402db59d1ad0f1e7",
        username: "Korosan",
        description: "This movie was great!"),
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

  void deleteComment(Comments comments){
    commentsList.remove(comments);
    notifyListeners();
  }

  List<Comments>  getComments(){
    return commentsList;
  }

}