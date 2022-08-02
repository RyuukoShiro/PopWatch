class MoviesAndShow {

  String id;
  String title;
  String description;
  String runtime;
  String company;
  String genre;
  String trailer;
  String poster;
  String cover;
  String type;

  MoviesAndShow({ required this.id, required this.title, required this.description, required
  this.runtime, required this.company, required this.genre,
  required this.trailer, required this.poster, required this.cover, required this.type});


  factory MoviesAndShow.fromMap(Map <String, dynamic> snapshot, String id) => MoviesAndShow(
      id: id,
      title: snapshot['title'] ?? '',
      description: snapshot['description'] ?? '',
      runtime: snapshot['runtime'] ?? '',
      company: snapshot['company'] ?? '',
      genre: snapshot['genre'] ?? '',
      trailer: snapshot['trailer'] ?? '',
      poster: snapshot['poster'] ?? '',
      cover: snapshot['cover'] ?? '',
      type: snapshot['type'] ?? '',
  );
}