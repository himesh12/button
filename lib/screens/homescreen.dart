import 'package:dating_desire/constants/colors.dart';
import 'package:dating_desire/constants/userdetails.dart';
import 'package:dating_desire/screens/pointtable.dart';
import 'package:dating_desire/screens/profilepage.dart';
import 'package:dating_desire/services/updateuserdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Home.dart';

class HomeScreen extends StatefulWidget {
  final int initial;
  HomeScreen({this.initial: 1});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool pointtable = false;
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 1;
  // ignore: unused_element
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;

      pointtable = false;
    });
  }

  getuserdetails() async {
    await ApiUpdateDetails().userdetails(token: accesstoken).then((value) {
      setState(() {
        for (int i = 0; i < value['images'].length; i++) {
          userimage.addAll({
            value['images'][i]['image_no'].toString(): value['images'][i]
                ['image']
          });
        }
        print(userimage);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getuserdetails();
    if (mounted) {
      setState(() {
        _selectedIndex = widget.initial;
      });
    } else {
      setState(() {
        _selectedIndex = widget.initial;
      });
    }
    pointtable = false;
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  List<Widget> _options = <Widget>[
    PointpageWidget(),
    Home(),
    ProfileWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _options.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2)],
        ),
        height: 50,
        margin: EdgeInsets.only(),
        child: BottomAppBar(
            child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            _audioCache.play('U5K3HD8-clicl.mp3');
                            setState(() {
                              _selectedIndex = 0;

                              pointtable = false;
                            });
                          },
                          child: Container(
                              child: FaIcon(
                                FontAwesomeIcons.coins,
                                size: 24,
                                color: _selectedIndex == 0
                                    ? Color(0xFF402BDB)
                                    : Colors.black,
                              ),
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Material(
                      color: Colors.red,
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: () {
                          _audioCache.play('U5K3HD8-clicl.mp3');
                          setState(() {
                            _selectedIndex = 1;

                            pointtable = false;
                          });
                        },
                        onLongPress: () => onLongPress(),
                        child: Container(
                            child: Icon(
                              Icons.home,
                              size: 30,
                              color: _selectedIndex == 1
                                  ? Color(0xFF402BDB)
                                  : Colors.black,
                            ),
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          onLongPress: () => onLongPress(),
                          onTap: () {
                            _audioCache.play('U5K3HD8-clicl.mp3');
                            setState(() {
                              _selectedIndex = 2;

                              pointtable = false;
                            });
                          },
                          child: Container(
                            child: Icon(
                              Icons.location_history_rounded,
                              size: 29,
                              color: _selectedIndex == 2
                                  ? Color(0xFF402BDB)
                                  : Colors.black,
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  pointtablewidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
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
          dividerline(context),
          GestureDetector(
            onTap: () {
              _audioCache.play('U5K3HD8-clicl.mp3');
              setState(() {
                pointtable = true;
              });
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
                    child: Image.network(
                      'https://img.icons8.com/external-justicon-lineal-color-justicon/2x/external-couple-romantic-love-justicon-lineal-color-justicon-1.png',
                      width: 50,
                      height: 50,
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
          dividerline(context),
          Container(
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
                  child: Image.network(
                    'https://img.icons8.com/external-justicon-lineal-color-justicon/2x/external-couple-romantic-love-justicon-lineal-color-justicon-1.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
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
          dividerline(context),
          Container(
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
                  child: Image.network(
                    'https://img.icons8.com/external-justicon-lineal-color-justicon/2x/external-couple-romantic-love-justicon-lineal-color-justicon-1.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
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
          dividerline(context),
          Container(
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
                  child: Image.network(
                    'https://img.icons8.com/external-itim2101-lineal-color-itim2101/2x/external-application-internet-of-things-itim2101-lineal-color-itim2101.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
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
          dividerline(context),
        ],
      ),
    );
  }

  onLongPress() {}
}

mixin _audioCache {
  static void play(String s) {}
}
