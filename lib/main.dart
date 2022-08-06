import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:popwatch/lists/comments_list.dart';
import 'package:popwatch/lists/favourites_list.dart';
import 'package:popwatch/lists/movie_show_list.dart';
import 'package:popwatch/lists/user_list.dart';
import 'package:popwatch/models/users.dart';
import 'package:popwatch/screens/favourites_screen.dart';
import 'package:popwatch/screens/home.dart';
import 'package:popwatch/screens/list_screen.dart';
import 'package:popwatch/screens/profile_screen.dart';
import 'package:popwatch/screens/splash_screen.dart';
import 'package:popwatch/services/firestore_service.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static final ValueNotifier<ThemeMode> themeNotifier = // This is used to change the theme of the app.
  ValueNotifier(ThemeMode.light); // This is used to change the theme of the app.
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,) {

    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        return MultiProvider(providers: [
        ChangeNotifierProvider<MovieShowProvider>(create: (context) => MovieShowProvider()),
          ChangeNotifierProvider<CommentsListProvider>(create: (context) => CommentsListProvider()),
          ChangeNotifierProvider<CurrentUserProvider>(create: (context) => CurrentUserProvider()),
          ChangeNotifierProvider<FavouritesListProvider>(create: (context) => FavouritesListProvider()),
        ],
          //The MultiProvider ensures that each provider is working on the page which it contains
          //ThemeNotifier allows the users to switch between light mode and dark mode
          child: ValueListenableBuilder<ThemeMode>(
            valueListenable: themeNotifier,
            builder: (_, ThemeMode currentMode, __){
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      appBarTheme: AppBarTheme(
                        color: Color(0xFFFFCCBC),
                      )
                  ),
                  darkTheme: ThemeData.dark(), // This is used to change the theme of the app.
                  themeMode: currentMode,
                  home: SplashScreen(),
                  routes: {
                    ListScreen.routeName: (_){
                      return ListScreen();
                    },
                    Home.routeName: (_){
                      return Home();
                    },
                    FavouritesScreen.routeName: (_){
                      return FavouritesScreen();
                    }
                  }
              );
            },
          ),
        );
      }
    );
  }
}

class MainScreen extends StatefulWidget {

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 1;
  final screens = [const ListScreen(), Home(), FavouritesScreen()];
  //Current index is on Home(), so when first launched the app will be shown on the Home() screen

  final user = FirebaseAuth.instance.currentUser!;
  FirestoreService fsService = FirestoreService();

  String profilePicture = ''; //profile picture of the user
  List<Users> currentUser = []; //list of the current user

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: fsService.getCurrentUser(), //gets the current user from the database
      builder: (context, snapshot) {
        return Consumer<CurrentUserProvider>(
          builder: (BuildContext context, provider, Widget? child) {
            currentUser = provider.currentUsers.where((element) => element.email == user.email).toList(); //gets the current user from the database by email
            if (currentUser[0].profilepicture == ''){ //if the user has no profile picture, then set the profile picture to the default profile picture
              profilePicture = ''; //default profile picture
            } else {
              profilePicture = currentUser[0].profilepicture; //if the user has a profile picture, then set the profile picture to the profile picture of the user
            }
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 60,
                title: const Text('PopWatch'),
                actions: [
                  GestureDetector(
                    child:
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(profilePicture), //gets the profile picture of the user from the database
                      )
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(), //goes to the profile screen
                        ),
                      );
                    },
                  ),
                  //Icon button for the switching of dark mode and light mode
                  IconButton(
                      icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                          ? Icons.dark_mode
                          : Icons.light_mode),
                      onPressed: () {
                        MyApp.themeNotifier.value =
                        MyApp.themeNotifier.value == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light;
                      })
                ],
              ),
              // Bottom Navigation to ensure navigation for each page
              body: screens[selectedIndex], //sets the body of the page to the selected page
              bottomNavigationBar: CurvedNavigationBar( //sets the bottom navigation bar to a curved navigation bar
                index: selectedIndex,
                height: 50,
                backgroundColor: const Color(0xFFFFFFFF),
                color: Color(0xFFFFCCBC),
                items: <Widget>[
                  Icon(Icons.list, size: 30),
                  Icon(Icons.home, size: 30),
                  Icon(Icons.favorite, size: 30),
                ],
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            );
          }
        );
      }
    );
  }
}
