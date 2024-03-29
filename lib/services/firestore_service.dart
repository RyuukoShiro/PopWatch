import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:popwatch/models/comments.dart';
import 'package:popwatch/models/movie_show.dart';
import 'package:popwatch/models/users.dart';

class FirestoreService {

  Stream<List<MoviesAndShow>> getMovieShowList() { // calls the function getMovieShowList from the firestore_service.dart
    return FirebaseFirestore.instance
        .collection('media')
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => MoviesAndShow.fromMap(doc.data(), doc.id)) // calls the function fromMap from the movie_show.dart
            .toList());
  }

  Stream<List<MoviesAndShow>> getFavourites() { // calls the function getFavourites from the firestore_service.dart
    return FirebaseFirestore.instance
        .collection('favourites')
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => MoviesAndShow.fromMap(doc.data(), doc.id)) // calls the function fromMap from the movie_show.dart
            .toList());
  }

  addMovieShow(title, description, runtime, company, genre , trailer, poster, cover, type){ // calls the function addMovieShow from the firestore_service.dart
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

  addFavourite(title, description, runtime, company, genre, trailer, poster, // calls the function and adds the current movie/show to the favourites list
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

  deleteFavourite(id) { // calls the function deleteFavourite from the firestore_service.dart
    FirebaseFirestore.instance.collection('favourites').doc(id).delete();
  }

  Stream<List<Users>> getCurrentUser() { // Gets the current users from the collection users in the firestore database
    return FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Users.fromMap(doc.data(), doc.id)).toList());
  }

  Stream<List<Comments>> getComments() { // Gets the comments from the collection comments in the firestore database
    return FirebaseFirestore.instance
        .collection('comments')
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Comments.fromMap(doc.data(), doc.id))
            .toList());
  }

  editProfile(Users users) { // Calls the function which edits the collection users in the firestore database by id
    FirebaseFirestore.instance.collection('users').doc(users.id).update({
      'profilepicture': users.profilepicture,
      'email': users.email,
      'username': users.username,
      'firstname': users.firstname,
      'lastname': users.lastname,
    });
  }


  addComment(movieTitle, profileicon, username, description) { // Calls the function which adds a comment to the collection comments in the firestore database
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

  deleteComment(id) { // Calls the function which deletes a comment from the collection comments in the firestore database
    FirebaseFirestore.instance.collection('comments').doc(id).delete();
  }

  editComment(Comments comments) { // Calls the function which edits a comment from the collection comments in the firestore database
      FirebaseFirestore.instance.collection('comments').doc(comments.id).update({
        'movieTitle': comments.movieTitle,
        'profileicon': comments.profileicon,
        'username': comments.username,
        'description': comments.description,
      });
  }

}

