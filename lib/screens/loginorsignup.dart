import 'package:dating_desire/constants/colors.dart';
import 'package:dating_desire/screens/login.dart';
import 'package:dating_desire/screens/signup1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginorSignup extends StatefulWidget {
  @override
  _LoginorSignupState createState() => _LoginorSignupState();
}

class _LoginorSignupState extends State<LoginorSignup> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage('assets/w4.jpg'), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Text(
                  'Get Started',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    'Lobster',
                    backgroundColor: Colors.white38,
                    color: blue,
                    fontSize: 42,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                  ),
                  child: Text(
                    'Get matched with people in a single day from your state, your country, or the whole world.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont('Josefin Sans',
                        backgroundColor: Colors.white38,
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(80, 20, 80, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Login();
                    }));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: AlignmentDirectional(-0.050000000000000044, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Text(
                        'Log In',
                        style: GoogleFonts.getFont(
                          'Josefin Sans',
                          color: Color(0xFFFDFAFA),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(80, 30, 80, 40),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Signuppage1Widget();
                    }));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFDFAFA),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: blue),
                    ),
                    alignment: AlignmentDirectional(-0.050000000000000044, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.getFont(
                          'Josefin Sans',
                          color: blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
