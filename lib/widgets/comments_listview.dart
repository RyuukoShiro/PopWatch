import 'package:flutter/material.dart';
import 'package:popwatch/lists/comments_list.dart';
import 'package:popwatch/models/comments.dart';
import 'package:popwatch/screens/editcomment.dart';
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
    CommentsList commentsProvider = Provider.of<CommentsList>(context);
    var commentsList = Provider.of<CommentsList>(context).getComments().where((element) => element.movieTitle == widget.movieTitle).toList();


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
            onDismissed: (direction) {
              setState((){
                commentsProvider.deleteComment(i);
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
