import 'package:flutter/material.dart';
import 'package:popwatch/lists/comments_list.dart';
import 'package:popwatch/models/comments.dart';
import 'package:popwatch/screens/editcomment.dart';
import 'package:popwatch/services/firestore_service.dart';
import 'package:provider/provider.dart';

class CommentsListView extends StatefulWidget {

  CommentsListView( {Key? key, required this.movieTitle}) : super(key: key);

  final String movieTitle;

  @override
  State<CommentsListView> createState() => _CommentsListViewState();
}

class _CommentsListViewState extends State<CommentsListView> {
  @override
  Widget build(BuildContext context) {
    //Calls the provider for CommentsList
    CommentsListProvider commentsProvider = Provider.of<CommentsListProvider>(context);
    // var commentList is used to call the provider where the current movieTitle which the MovieDetails is in.
    var commentsList = Provider.of<CommentsListProvider>(context).getComments().where((element) => element.movieTitle == widget.movieTitle).toList();
    FirestoreService fsService = FirestoreService();

    return Scaffold(
      body: ListView.builder(
        itemCount: commentsList.length, itemBuilder: (ctx, i){
          final commetsList = commentsList[i];
        return Card(
          child: Dismissible(
            background: Container(
              color: Colors.red,
              child: Icon(Icons.delete, size: 25, color: Colors.white),
            ),
            key: UniqueKey(),
            //Calls the function deleteComment based on the Index (i) when swiped right or left.
            onDismissed: (direction) {
              setState((){
                fsService.deleteComment(widget.movieTitle);
                // commentsProvider.deleteComment(i);
              });
            },
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(commetsList.profileicon
                ),
              ),
              title: Text(commetsList.username),
              subtitle: Text(commetsList.description),
              trailing: IconButton(
                icon: Icon(Icons.edit, color: Color(0xFFFFCCBC), size:25),
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EditComment(comments: commentsProvider.getComments()[i], movieTitle: widget.movieTitle,))
                  );
                },
              ),
            ),
          ),
        );
      },
      )
    );
  }
}
