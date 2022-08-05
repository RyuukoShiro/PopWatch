import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:popwatch/models/comments.dart';
import 'package:popwatch/models/movie_show.dart';
import 'package:popwatch/models/users.dart';

class FirestoreService {

  Stream<List<MoviesAndShow>> getMovieShowList() {
    return FirebaseFirestore.instance
        .collection('media')
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => MoviesAndShow.fromMap(doc.data(), doc.id))
            .toList());
  }

  Stream<List<MoviesAndShow>> getFavourites() {
    return FirebaseFirestore.instance
        .collection('favourites')
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => MoviesAndShow.fromMap(doc.data(), doc.id))
            .toList());
  }

  addMovieShow(title, description, runtime, company, genre , trailer, poster, cover, type){
    FirebaseFirestore.instance.collection('media').add({
      'title': title,
      'description': description,
      'runtime': runtime,
      'company': company,
      'genre': genre,
      'trailer': trailer,
      'poster': poster,
      'cover': cover,
      'type': type,
    });
  }

  addFavourite(title, description, runtime, company, genre, trailer, poster,
      cover, type) {
    FirebaseFirestore.instance.collection('favourites').add({
      'title': title,
      'description': description,
      'runtime': runtime,
      'company': company,
      'genre': genre,
      'trailer': trailer,
      'poster': poster,
      'cover': cover,
      'type': type,
    });
  }

  deleteFavourite(id) {
    FirebaseFirestore.instance.collection('favourites').doc(id).delete();
  }

  Stream<List<Users>> getCurrentUser() {
    return FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Users.fromMap(doc.data(), doc.id)).toList());
  }

  Stream<List<Comments>> getComments() {
    return FirebaseFirestore.instance
        .collection('comments')
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Comments.fromMap(doc.data(), doc.id))
            .toList());
  }

  editProfile(Users users) {
    FirebaseFirestore.instance.collection('users').doc(users.id).update({
      'profilepicture': users.profilepicture,
      'email': users.email,
      'username': users.username,
      'firstname': users.firstname,
      'lastname': users.lastname,
    });
  }


  addComment(movieTitle, profileicon, username, description) {
    String ids=
    FirebaseFirestore.instance.collection('comments').doc().id.toString();
    return
      FirebaseFirestore.instance.collection('comments').doc(ids).set({
        'id': ids,
        'movieTitle': movieTitle,
        'profileicon': profileicon,
        'username': username,
        'description': description,
      });
  }

  deleteComment(id) {
    FirebaseFirestore.instance.collection('comments').doc(id).delete();
  }

  editComment(Comments comments) {
      FirebaseFirestore.instance.collection('comments').doc(comments.id).update({
        'movieTitle': comments.movieTitle,
        'profileicon': comments.profileicon,
        'username': comments.username,
        'description': comments.description,
      });
  }

}

