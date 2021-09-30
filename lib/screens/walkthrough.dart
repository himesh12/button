import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'loginorsignup.dart';

class WalkThrough extends StatefulWidget {
  @override
  _WalkThroughState createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int indexofpage = 0;
  int currentpos = 0;

  PageController _controller = PageController(initialPage: 0, keepPage: false);
  @override
  void initState() {
    super.initState();
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
          alignment: AlignmentDirectional(0.050000000000000044, 0),
          child: Stack(
            children: [
              PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    indexofpage = value;
                  });
                  if (value == 3) {
                    // afterlastpage();
                  }
                },
                children: [
                  page1(),
                  page2(),
                  page3(),
                  page4(),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [1, 2, 3, 4].map((url) {
                    int index = [1, 2, 3, 4].indexOf(url);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: indexofpage == index
                            ? Colors.white
                            : Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  afterlastpage() async {
    await Future.delayed(
        Duration(seconds: 3),
        () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => LoginorSignup(),
            ),
            (route) => false));
  }

  Widget page1() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
          // color: Colors.white,
          image: DecorationImage(
              image: AssetImage(
                'assets/w1.jpeg',
              ),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Image.asset(
              'assets/logo.png',
              height: 200,
              width: 200,
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width, //* 0.7,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 45),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        'Get a date',
                        style: GoogleFonts.getFont('Lobster',
                            color: Colors.red,
                            backgroundColor: Colors.black54,
                            fontSize: 40,
                            fontWeight: FontWeight
                                .w500), /*GoogleFonts.getFont('Josefin Sans',
                          color: Colors.white,
                          backgroundColor: Colors.black54,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),*/
                      ),
                    ),
                    Text(
                      'Get Matched in a Single Day without Wasting Weeks and Months.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        'Josefin Sans',
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      'Get a perfect date for yourself on the very first day of using Dating Desire.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        'Josefin Sans',
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget page2() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
          // color: Colors.white,
          image: DecorationImage(
              image: AssetImage(
                'assets/w6.jpg',
              ),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width, //* 0.7,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Image.asset(
                        'assets/notification_bell.png',
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Text(
                        'Get Notified',
                        style: GoogleFonts.getFont('Lobster',
                            color: Colors.red,
                            backgroundColor: Colors.black54,
                            fontSize: 40,
                            fontWeight: FontWeight
                                .w500), /*GoogleFonts.getFont('Josefin Sans',
                          color: Colors.white,
                          backgroundColor: Colors.black54,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),*/
                      ),
                    ),
                    Text(
                      'Receive notifications whenever you get a message or a match.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        'Josefin Sans',
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget page3() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
          // color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/w2.jpeg'), fit: BoxFit.cover)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width, //* 0.7,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Text(
                        'Love is for all',
                        style: GoogleFonts.getFont('Lobster',
                            color: Colors.red,
                            backgroundColor: Colors.black54,
                            fontSize: 40,
                            fontWeight: FontWeight
                                .w500), /*GoogleFonts.getFont('Josefin Sans',
                          color: Colors.white,
                          backgroundColor: Colors.black54,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),*/
                      ),
                    ),
                    Text(
                      'No matter what your age is love is good for health.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        'Josefin Sans',
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget page4() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
          // color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/w3.jpeg'), fit: BoxFit.cover)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width, //* 0.7,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Text(
                        'Love is across the world',
                        style: GoogleFonts.getFont('Lobster',
                            color: Colors.red,
                            backgroundColor: Colors.black54,
                            fontSize: 40,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      'Get Matched with people from your state, your country, or the whole world',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        'Josefin Sans',
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0, bottom: 25),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => LoginorSignup(),
                        ),
                        (route) => false);
                  },
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: Color(0xFF402BDB),
                        borderRadius: BorderRadius.circular(15)),
                    height: 40,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Row(
                        children: [
                          Text(
                            'Next',
                            style: GoogleFonts.getFont(
                              'Josefin Sans',
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
