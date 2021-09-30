import 'package:dating_desire/constants/colors.dart';
import 'package:dating_desire/screens/aboutgaefta.dart';
import 'package:dating_desire/screens/watchad.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PointpageWidget extends StatefulWidget {
  @override
  _PointpageWidgetState createState() => _PointpageWidgetState();
}

class _PointpageWidgetState extends State<PointpageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Object? get player => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
               Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.transparent,
         onTap: () {
                  _audioCache.play('U5K3HD8-clicl.mp3');
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => WatchAd()));
                },
              
              child:Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0x00EEEEEE),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(9, 0, 0, 0),
                      child: Image.network(
                        'https://img.icons8.com/external-vitaliy-gorbachev-lineal-color-vitaly-gorbachev/2x/external-earth-mother-earth-day-vitaliy-gorbachev-lineal-color-vitaly-gorbachev-2.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Text(
                        'How It Works',
                        style: GoogleFonts.getFont(
                          'Josefin Sans',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
        ),),
              dividerline(context),
              GestureDetector(
                 child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                      splashColor: Colors.transparent,
                       
                onTap: () {
                  _audioCache.play('U5K3HD8-clicl.mp3');
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => WatchAd()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(11, 0, 0, 0),
                        child: Image.network(
                          'https://img.icons8.com/external-justicon-lineal-color-justicon/2x/external-couple-romantic-love-justicon-lineal-color-justicon-1.png',
                          width: 47,
                          height: 47,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: Text(
                          'Watch Ad & Start Dating',
                          style: GoogleFonts.getFont(
                            'Josefin Sans',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
                 ),
              ),
              dividerline(context),
               Material(
                      color: Colors.transparent,
                      child: InkWell(
                      splashColor: Colors.transparent,
                        onTap: () {
                  _audioCache.play('U5K3HD8-clicl.mp3');
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => WatchAd()));
                },
                       
              child:Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0x00EEEEEE),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(7, 0, 0, 0),
                      child: Image.asset(
                        'assets/logo2.png',
                        width: 55,
                        height: 55,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                      child: Text(
                        'About Dating Desire',
                        style: GoogleFonts.getFont(
                          'Josefin Sans',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
                      ),),
              dividerline(context),
              GestureDetector(
                 child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                      splashColor: Colors.transparent,
                       onTap: () {
                         _audioCache.play('U5K3HD8-clicl.mp3');
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AboutGaefta()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(7, 0, 0, 0),
                        child: SvgPicture.asset(
                          'assets/gaeftalogo2.svg',
                          height: 55,
                          width: 55,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                        child: Text(
                          'About Gaefta',
                          style: GoogleFonts.getFont(
                            'Josefin Sans',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
                 ),),
              dividerline(context),
               Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.transparent,
         onTap: () {
                         _audioCache.play('U5K3HD8-clicl.mp3');
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AboutGaefta()));
                },
              child:Container(
              
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0x00EEEEEE),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(13, 0, 0, 0),
                      child: Image.network(
                        'https://img.icons8.com/external-itim2101-lineal-color-itim2101/2x/external-application-internet-of-things-itim2101-lineal-color-itim2101.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(11, 0, 0, 0),
                      child: Text(
                        'Others Apps of Gaefta',
                        style: GoogleFonts.getFont(
                          'Josefin Sans',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
        ),),
              dividerline(context),
            ],
          ),
        ),
      ),
    );
  }

  onPress() {}
   onLongPress() {}
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('player', player));
  }
}

mixin _audioCache {
  static void play(String s) {}
}

class AudioCache {
  void play(String s) {}
}

