import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:popwatch/main.dart';
import 'package:popwatch/screens/addmovieshow_screen.dart';
import 'package:popwatch/screens/signin_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
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
              const Icon(
                Icons.account_circle,
                size: 125,
                color: Color(0xFFFFFFFF),
              ),
              Text("" + user.email!, style: TextStyle(
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
                          Text("View Favourites",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),)
                      ),
                    ),
                  ),
                  onTap: (){
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
                          Text("Delete Account",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),)
                      ),
                    ),
                  ),
                  onTap: (){
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
                    FirebaseAuth.instance.signOut();
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
}
