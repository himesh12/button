import 'dart:async';

import 'package:dating_desire/constants/userdetails.dart';
import 'package:dating_desire/screens/walkthrough.dart';
import 'package:dating_desire/services/updateuserdetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homescreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController controller;

  late Animation animation;
  int indexofpage = 0;

  @override
  void initState() {
    super.initState();
    textopacity();
    openStartPage();

    controller = AnimationController(
        vsync: this, duration: Duration(seconds: 3), value: 0.1);

    animation = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  double opc = 0.2;

  textopacity() async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          opc = opc + 0.2;
        });
      }
      if (opc == 0.8) {
        timer.cancel();
      }
    });
  }

  checkuseralreadyloggedin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool userloggedin = prefs.getBool("userloggedin") ?? false;
    String usertoken = prefs.getString("usertoken") ?? "";

    print('userloggedin $userloggedin');
    return {'userloggedin': userloggedin, 'usertoken': usertoken};
  }

  openStartPage() async {
    Map<String, dynamic> userloggedin = await checkuseralreadyloggedin();
    print(userloggedin['usertoken']);
    if (userloggedin['userloggedin']) {
      setState(() {
        accesstoken = userloggedin['usertoken'];
      });
      await ApiUpdateDetails().userdetails(token: accesstoken).then((value) {
        setState(() {
          name = value['name'];
          age = value['age'].toString();
          bio = value['bio'] == null ? "" : value['bio'];
          state = value['state'];
          country = value['country'];
        });
      });
    }
    await Future.delayed(
      Duration(seconds: 5),
      () => userloggedin['userloggedin']
          ? Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => HomeScreen(), //OnBoardingPage(),
              ),
              (route) => false)
          : Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => WalkThrough(), //OnBoardingPage(),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          alignment: AlignmentDirectional(0.050000000000000044, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .1,
              ),
              ScaleTransition(
                scale: controller,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/logo.png',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                'The Fastest Dating App Available on earth',
                style: GoogleFonts.getFont(
                  'Josefin Sans',
                  fontSize: 20,
                  color: Color.fromRGBO(255, 0, 0, opc),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Get Matched in a Single Day',
                style: GoogleFonts.getFont(
                  'Josefin Sans',
                  fontSize: 20,
                  color: Color(0xFF402BDB),
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
