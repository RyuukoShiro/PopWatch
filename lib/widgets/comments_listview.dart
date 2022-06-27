import 'package:flutter/material.dart';
import 'package:popwatch/models/commets.dart';

class CommentsListView extends StatelessWidget {

  CommentsListView(this.commentsList, {Key? key}) : super(key: key);
  List<Comments> commentsList;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView.builder(
        itemCount: commentsList.length, itemBuilder: (ctx, i){
          final commetsList = commentsList[i];
        return ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(commetsList.profileicon
            ),
          ),
          title: Text(commetsList.username),
          subtitle: Text(commetsList.description),
          trailing: Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit, color: Color(0xFFFFAB91), size:25),
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red, size: 25),
                    onPressed: (){
                  // if (commentsList.getComments().every((element) =>
                  // element.username != commentsList.username))
                    },
              ),
            ],
          ),
        );
      },
      )
    );
  }
}
