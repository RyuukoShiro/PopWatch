import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:popwatch/lists/user_list.dart';
import 'package:popwatch/models/users.dart';
import 'package:popwatch/screens/addmovieshow_screen.dart';
import 'package:popwatch/screens/editprofile.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser!; // calls the current user.


  @override
  Widget build(BuildContext context) {
    CurrentUserProvider currentUserProvider = Provider.of<CurrentUserProvider>(context); // calls the current user provider.
    List<Users> currentUser = []; // calls the current user.

    return Consumer<CurrentUserProvider>( // calls the current user provider.
      builder: (BuildContext context, provider, Widget? child) { // calls the current user provider.
        currentUser = provider.currentUsers.where((element) => element.email == user.email).toList();
        currentUser[0].profilepicture;

        return StreamBuilder(
          stream: fsService.getCurrentUser(),
          builder: (context, snapshot) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Profile', textAlign: TextAlign.center,),
                automaticallyImplyLeading: true,
                leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)
                ),
              ),
              backgroundColor: Color(0xFFFFCCBC),
              body: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 68,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 65,
                          backgroundImage: NetworkImage(currentUser[0].profilepicture), // calls the current user profile picture.
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(currentUser[0].username, style: TextStyle( // calls the current user username.
                        fontSize: 20,
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(height: 25,),
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFAB91),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child:
                                Text("Edit Profile",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),)
                            ),
                          ),
                        ),
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => EditProfileScreen(users: currentUser[0],)) // calls the edit profile screen.
                            );
                          },
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(builder: (context) => EditComment(comments: commentsProvider.getComments()[i], movieTitle: widget.movieTitle,))
                          // );
                      ),
                      SizedBox(height: 15,),
                      InkWell(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFAB91),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                  child:
                                  Text("Add Movie/Show",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),)
                              ),
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => AddMovieShow())
                            );
                          }
                      ),
                      SizedBox(height: 15,),
                      InkWell(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFAB91),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                  child:
                                  Text("Logout",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),)
                              ),
                            ),
                          ), onTap: () {
                            FirebaseAuth.instance.signOut(); // calls the logout function.
                            Navigator.pop(context);
                      },
                          // onTap: (){
                          //   Navigator.of(context).push(
                          //       MaterialPageRoute(builder: (context) => MainScreen())
                          //   );
                          // }
                      ),
                    ],
                  ),
                ),
              )
            );
          }
        );
      }
    );

  }
}
