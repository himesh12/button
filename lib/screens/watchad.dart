import 'package:dating_desire/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class WatchAd extends StatefulWidget {
  @override
  _WatchAdState createState() => _WatchAdState();
}

class _WatchAdState extends State<WatchAd> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: ListView(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0, left: 2),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                return HomeScreen(
                                  initial: 0,
                                );
                              }), (route) => false);
                            },
                            icon: Icon(Icons.arrow_back,
                                color: Colors.white, size: 34),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0, left: 12),
                            child: Container(
                              child: Text(
                                'Watch Ad and Start Dating',
                                style: GoogleFonts.getFont(
                                  'Josefin Sans',
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7,
                              color: Colors.white,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Profile displays remaining:  1',
                          style: GoogleFonts.getFont(
                            'Josefin Sans',
                            color: Color(0xFFDAA520),
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 80.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7,
                              color: Colors.white,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Date clicks remaining:  1',
                          style: GoogleFonts.getFont(
                            'Josefin Sans',
                            color: Color(0xFFDAA520),
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Click on the Ad icon to view Ads',
                      style: GoogleFonts.getFont(
                        'Josefin Sans',
                        fontSize: 30,
                        color: Color(0xFFDAA520),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          'For every 10 Ads you watch get 5 profile display clicks and 5 date clicks.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(
                            'Josefin Sans',
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 40),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7,
                              color: Colors.white,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: AlignmentDirectional(0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Ad Watched:  1/10',
                              style: GoogleFonts.getFont('Josefin Sans',
                                  color: Colors.white, fontSize: 30),
                            ),
                            FaIcon(
                              FontAwesomeIcons.ad,
                              color: Color(0xFFDAA520),
                              size: 134,
                            ),
                            Text(
                              'Click here to watch Ads',
                              style: GoogleFonts.getFont(
                                'Josefin Sans',
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
