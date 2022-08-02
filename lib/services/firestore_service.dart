import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:popwatch/models/movie_show.dart';

class FirestoreService{

Stream<List<MoviesAndShow>> getMovieShowList() {
    return FirebaseFirestore.instance
        .collection('media')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => MoviesAndShow.fromMap(doc.data(), doc.id)).toList());
  }

}