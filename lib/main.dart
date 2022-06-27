import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:popwatch/lists/comments_list.dart';
import 'package:popwatch/lists/favourites_list.dart';
import 'package:popwatch/lists/movie_show_list.dart';
import 'package:popwatch/screens/favourites_screen.dart';
import 'package:popwatch/screens/home.dart';
import 'package:popwatch/screens/list_screen.dart';
import 'package:popwatch/screens/login_register_screen.dart';
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


    return MultiProvider(providers: [
    ChangeNotifierProvider<MovieShowList>(create: (context) => MovieShowList()),
      ChangeNotifierProvider<FavouritesList>(create: (context) => FavouritesList()),
      ChangeNotifierProvider<CommentsList>(create: (context) => CommentsList()),
    ],
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
}

class MainScreen extends StatefulWidget {

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 1;
  final screens = [const ListScreen(), Home(), FavouritesScreen()];
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
                MaterialPageRoute(builder: (context) => const LoginRegisterScreen())
              );
            },
          ),
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
