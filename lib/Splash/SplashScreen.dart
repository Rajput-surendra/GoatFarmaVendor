import 'dart:async';
import 'package:flutter/material.dart';
import 'package:madhu_farma/Screens/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';



import '../Auth/LoginScreen.dart';
import '../Screens/MadhuFarmScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    inIt();
    // Timer(Duration(seconds: 3), () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> IntroSlider()));});
    super.initState();
  }
  inIt() {
    Future.delayed(const Duration(seconds:2),() async{

      SharedPreferences prefs  = await SharedPreferences.getInstance();
      String? userId  =  prefs.getString('userId');
      if(userId == null) {
        if(mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
      }else{
        if(mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MadhuFarmScreen()));
      }

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        //  width: 300,
        child: Image(
          image: AssetImage('assets/images/splash screen.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}