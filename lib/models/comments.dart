class Comments{

  String id;
  String movieTitle;
  String profileicon;
  String username;
  String description;

  Comments( {
    required this.id, required this.movieTitle ,required this.profileicon, required this.username, required this.description,
});
  // Function for the firestore to get the comments.
  factory Comments.fromMap(Map<String, dynamic> snapshot, String id) => Comments(
    id: id,
    movieTitle: snapshot['movieTitle'],
    profileicon: snapshot['profileicon'],
    username: snapshot['username'],
    description: snapshot['description'],
  );

}