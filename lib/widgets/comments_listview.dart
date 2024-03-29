import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:popwatch/lists/comments_list.dart';
import 'package:popwatch/lists/user_list.dart';
import 'package:popwatch/models/comments.dart';
import 'package:popwatch/models/users.dart';
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



    FirestoreService fsService = FirestoreService();
    final user = FirebaseAuth.instance.currentUser!;

    List<Users> currentUser = [];
    List<Comments> currentComment = [];

    return StreamBuilder(
      stream: fsService.getComments(),
      builder: (context, snapshots) {
        return Consumer2<CommentsListProvider, CurrentUserProvider>(
          builder: (BuildContext, Provider, CurrentUserProvider provider, child) {
            currentUser = provider.currentUsers.where((element) => element.email == user.email).toList();
            var currentComment = commentsProvider.getComments().where((element) => element.movieTitle == widget.movieTitle).toList();
            return Scaffold(
              body: ListView.builder(
                itemCount: currentComment.length, itemBuilder: (ctx, i){
                final commetsList = currentComment[i];
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
                        if (currentUser[0].username == currentComment[i].username) {
                          fsService.deleteComment(currentComment[i].id);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('You are not the owner of this comment!'),
                          ));
                        }
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
                          if (currentUser[0].username == currentComment[i].username) {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => EditComment(comments: currentComment[i], movieTitle: widget.movieTitle,))
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('You are not the owner of this comment!'),
                            ));
                          }
                        },
                      ),
                    ),
                  ),
                );
              },
              )
            );
          }
        );
      }
    );
  }
}
