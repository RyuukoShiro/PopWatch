import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  Future<UserCredential> register(email, password) { // calls the function register from the firebase_auth.dart
    return FirebaseAuth.instance.createUserWithEmailAndPassword(email: email,
        password: password);
  }
  Future<UserCredential> login(email, password) { // calls the function login from the firebase_auth.dart
    return FirebaseAuth.instance.signInWithEmailAndPassword(email: email,
        password: password);
  }
  Stream<User?> getAuthUser() { // calls the function getAuthUser from the firebase_auth.dart
    return FirebaseAuth.instance.authStateChanges();
  }
  logOut() { // calls the function logOut from the firebase_auth.dart
    return FirebaseAuth.instance.signOut();
  }
}