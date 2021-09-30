import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen2 extends StatefulWidget {
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/splashscreen.jpeg',
                ),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
