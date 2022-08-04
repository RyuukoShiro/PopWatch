import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:popwatch/models/users.dart';

class CurrentUserProvider with ChangeNotifier{

  List<Users> currentUsers = [];

  CurrentUserProvider(){
    FirebaseFirestore.instance.collection('users').snapshots().listen((event){
      for (var change in event.docChanges){
        print(change.doc.data());
        Users users = Users.fromMap(change.doc.data()!, change.doc.id);
        switch (change.type){
          case DocumentChangeType.added:
            currentUsers.add(users);
            break;
          case DocumentChangeType.modified:
            currentUsers.removeWhere((element) => element.id == users.id);
            currentUsers.add(users);
            break;
          case DocumentChangeType.removed:
            currentUsers.removeWhere((element) => element.id == users.id);
            break;
        }
      }
    });
  }

}