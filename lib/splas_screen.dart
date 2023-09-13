import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mavaen_timer/timer_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).
      pushReplacement(MaterialPageRoute(builder: (context) => TimerScreen(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'splashh_logo',
          child: Material(
            type: MaterialType.transparency,
            child: Icon(Icons.timelapse,size: 36,color: Colors.white,),
          ),
        ),

      ),
    );
  }
}
