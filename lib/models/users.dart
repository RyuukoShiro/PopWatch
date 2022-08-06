class Users {

  String id;
  String profilepicture;
  String username;
  String email;
  String firstname;
  String lastname;
  String password;

  Users({
    required this.id,
    required this.profilepicture,
    required this.username,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.password,

});

 // Function for the firestore to get the users.
  factory Users.fromMap(Map<String, dynamic> snapshot, String id) => Users(
      id: id,
      profilepicture: snapshot['profilepicture'],
      username: snapshot['username'] ?? '',
      email: snapshot['email'] ?? '',
      firstname: snapshot['firstname'] ?? '',
      lastname: snapshot['lastname'] ?? '',
      password: snapshot['password'] ?? '',
  );


}