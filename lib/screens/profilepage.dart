import 'package:carousel_slider/carousel_slider.dart';
// ignore: unused_import
import 'package:dating_desire/api/apiurl.dart';
import 'package:dating_desire/constants/colors.dart';
import 'package:dating_desire/constants/userdetails.dart';
import 'package:dating_desire/screens/loginorsignup.dart';
import 'package:dating_desire/screens/message.dart';
import 'package:dating_desire/services/logoutapi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
    

import 'editprofile.dart';
import 'newinterest.dart';


class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
    late AudioCache _audioCache;
  final pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
   final player = AudioCache();
  bool tapped = false;

  int currentPos = 0;
  int listnumber = -1;

  get buttonPressedColor => Colors.blueGrey;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      
      appBar: AppBar(
        // systemOverlayStyle: SystemUiOverlayStyle.dark,
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              size: 35,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return EditprofilepageWidget();
              }));
               _audioCache.play('U5K3HD8-clicl.mp3');
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 32,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Center(
          child: Text(
            'My profile',
            style: GoogleFonts.getFont(
              'Josefin Sans',
              color: Colors.black,
              fontSize: 36,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /* Stack(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 0.0, top: 5, bottom: 40),
                              child: Text(
                                'My profile',
                                style: GoogleFonts.getFont(
                                  'Josefin Sans',
                                  color: Colors.black,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: Icon(
                                Icons.edit,
                                size: 35,
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return EditprofilepageWidget();
                                }));
                              },
                            ),
                          )
                        ],
                      ),
                     */
                      Container(
                        height: 150,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(2),
                              bottomRight: Radius.circular(2),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(2),
                            ),
                          ),
                          child: Stack(
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                    height:
                                        MediaQuery.of(context).size.width * .8,
                                    viewportFraction: 1,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        currentPos = index;
                                      });
                                    }),
                                items: [
                                  for (int i = 0; i < userimage.length; i++)
                                    ClipRRect(
                                      child: Image.network(
                                          userimage.values.elementAt(i),
                                          fit: BoxFit.fitHeight),
                                    )
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for (int i = 0; i < userimage.length; i++)
                                      Container(
                                        width: 8.0,
                                        height: 8.0,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 2.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: currentPos == i
                                              ? Colors.black26
                                              : Colors.grey[
                                                  300], //.fromRGBO(0, 0, 0, 0.4),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ],
                          ) /*ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        'https://picsum.photos/seed/782/600',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),*/
                          ),
                      Padding(
                        padding: EdgeInsets.only(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Icon(
                                Icons.settings_outlined,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
                              child: Text(
                                '$name, $age',
                                style: GoogleFonts.getFont(
                                  'Josefin Sans',
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width * .9,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bio-  ',
                              style: GoogleFonts.getFont(
                                'Josefin Sans',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  '$bio',
                                  style: GoogleFonts.getFont(
                                    'Josefin Sans',
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.60,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        color: Color(0xFF0F0B0B),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 10, right: 5, bottom: 3),
                            child: FaIcon(
                              FontAwesomeIcons.crown,
                              color: Color(0xFFEDB016),
                              size: 22,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Text(
                              'Buy Rich Profile Tag',
                              style: GoogleFonts.getFont(
                                'Josefin Sans',
                                color: Color(0xFFEEAF14),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Color(0xFFF1B215),
                            size: 32,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .8,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(blurRadius: 6, color: Colors.black26),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Purchased rich profile 1 times',
                            style: GoogleFonts.getFont(
                              'Josefin Sans',
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            'Purchased  super rich profile 1 times',
                            style: GoogleFonts.getFont(
                              'Josefin Sans',
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                      dividerline(context),
                      GestureDetector(
                     
                      child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                         _audioCache.play('U5K3HD8-clicl.mp3');
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return NewinterestWidget();
                      }));
                      },
                      //onTap: ) => onPress(),
                      //onLongPress: () => onPress(),
                      child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0x00EEEEEE),
                        
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
                              child: Icon(
                                Icons.favorite,
                                color: Color(0xFFEC1D1D),
                                size: 30,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'New Interest',
                                style: GoogleFonts.getFont(
                                  'Josefin Sans',
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '1',
                                          style: GoogleFonts.getFont(
                                            'Josefin Sans',
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                     ),
                      ),
                  dividerline(context),
                  GestureDetector(
                     
                      child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                         _audioCache.play('U5K3HD8-clicl.mp3');
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Messenger();
                      }));
                      },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0x00EEEEEE),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
                            child: Icon(
                              Icons.message,
                              color: Color(0xFF3E76EE),
                              size: 30,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Messages',
                              style: GoogleFonts.getFont(
                                'Josefin Sans',
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 20.0),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    '1',
                                    style: GoogleFonts.getFont(
                                      'Josefin Sans',
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
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
                     ),
                  ),
                  dividerline(context),
                   Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.transparent,
             onTap: () {
                         _audioCache.play('U5K3HD8-clicl.mp3');
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return LoginorSignup();
                      }));
                      },
                  child:Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0x00EEEEEE),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 15, bottom: 2),
                          child: Icon(
                            Icons.check_circle_outline,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                        Text(
                          'My check-in',
                          style: GoogleFonts.getFont(
                            'Josefin Sans',
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
        ),
                   ),
                  dividerline(context),
                  Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.transparent,
             onTap: () => onPress(),
                  child:Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0x00EEEEEE),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 15, bottom: 4),
                          child: FaIcon(
                            FontAwesomeIcons.crown,
                            color: Color(0xFFEEAF14),
                            size: 24,
                          ),
                        ),
                        Text(
                          'Buy Rich Profiles',
                          style: GoogleFonts.getFont(
                            'Josefin Sans',
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                  ),
                  ),
                  dividerline(context),
                  Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.blueGrey,
           onTap: () {
                         _audioCache.play('U5K3HD8-clicl.mp3');
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return LoginorSignup();
                      }));
                      },
             
                 child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0x00EEEEEE),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12, right: 15),
                          child: FaIcon(
                            FontAwesomeIcons.peopleCarry,
                            color: Colors.black,
                            size: 22,
                          ),
                        ),
                        Text(
                          'Customer Support',
                          style: GoogleFonts.getFont(
                            'Josefin Sans',
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
        ),
                  ),
                GestureDetector(
                     
                      child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                      splashColor: Colors.grey,
                       onTap: () {
                         _audioCache.play('U5K3HD8-clicl.mp3');
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return LoginorSignup();
                      }));
                      },
                      
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0x00EEEEEE),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12, right: 15),
                            child: Icon(
                              Icons.logout,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          Text(
                            'Log into another account',
                            style: GoogleFonts.getFont(
                              'Josefin Sans',
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                    ),
                  ),
                  dividerline(context),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  deleteuserdatalogout() async {
    ApiLogout().logout().then((value) async {
      if (value['statuscode'] == 200 && value['success'] == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('usertoken', "");
        await prefs.setBool('userloggedin', false);
      }
    });
  }

  onPress() {}

  onLongPress() {}
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('player', player));
  }
}

class AudioCache {
  void play(String s) {}
}
