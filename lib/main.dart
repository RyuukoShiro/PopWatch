import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:popwatch/lists/comments_list.dart';
import 'package:popwatch/lists/favourites_list.dart';
import 'package:popwatch/lists/movie_show_list.dart';
import 'package:popwatch/lists/user_list.dart';
import 'package:popwatch/screens/favourites_screen.dart';
import 'package:popwatch/screens/home.dart';
import 'package:popwatch/screens/list_screen.dart';
import 'package:popwatch/screens/profile_screen.dart';
import 'package:popwatch/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static final ValueNotifier<ThemeMode> themeNotifier =
  ValueNotifier(ThemeMode.light);
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        return MultiProvider(providers: [
        ChangeNotifierProvider<MovieShowProvider>(create: (context) => MovieShowProvider()),
          ChangeNotifierProvider.value(value: CurrentUserProvider()),
          ChangeNotifierProvider.value(value: FavouritesListProvider()),
          ChangeNotifierProvider.value(value: CommentsListProvider()),
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
                        color: const Color(0xFFFFCCBC),
                      )
                  ),
                  darkTheme: ThemeData.dark(),
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text('PopWatch'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen())
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
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "")
        ],
        currentIndex: selectedIndex,
        onTap:  (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
