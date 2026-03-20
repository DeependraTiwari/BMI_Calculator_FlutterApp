
import 'dart:async';

import 'login_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>{

  static const String islogin = 'login';
  @override
  void initState(){
    super.initState();
    conditionalGoToScreen();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue.shade300,
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 70,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 65,
              child: Icon(Icons.person, color: Colors.lightGreen, size:100),
            ),
          ),
        )
      ),
    );
  }
  
  void conditionalGoToScreen() async{
    var sharedpref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedpref.getBool(islogin);

    Timer(const Duration(seconds: 2), (){
        if (isLoggedIn != null){
          if (isLoggedIn){
            Navigator.pushReplacement(context,  MaterialPageRoute(builder: (_) => const HomeScreen()));
          } else {
            Navigator.pushReplacement(context,  MaterialPageRoute(builder: (_) => const LoginPage()));
          }
        }else{
          Navigator.pushReplacement(context,  MaterialPageRoute(builder: (_) => const LoginPage()));
        }
      }
    );
  }
}