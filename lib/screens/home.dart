import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dating_desire/constants/userdetails.dart';
import 'package:dating_desire/constants/usermodel.dart';
import 'package:dating_desire/services/alluserapi.dart';
import 'package:dating_desire/services/ignoreanddate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currentPos = 0;
  List checkignorecommon = [];
  List checkignorebyfilter = [];
  List checkdatecommon = [];

  List checkdatebyfilter = [];
  int areadropdown = 0;
  List profiletypevalue = ["common_people", "rich_people", "super_rich"];

  int profiletype = 0;

  void initState() {
    super.initState();
    IgnoreAndDate().ignoreget().then((value) {
      if (value['statuscode'] == 200 && value['success'] == 200) {
        setState(() {
          int length = value['output']['ignores'] == null
              ? 0
              : value['output']['ignores'].length;

          for (int i = 0; i < length; i++) {
            checkignorecommon
                .add(value['output']['ignores'][i]['ignore_user_id']);
          }
        });
      } else {
        print('user not found');
      }
    });
    IgnoreAndDate().dateget().then((value) {
      if (value['statuscode'] == 200 && value['success'] == 200) {
        setState(() {
          int length = value['output']['dates'] == null
              ? 0
              : value['output']['dates'].length;
          for (int i = 0; i < length; i++) {
            checkdatecommon.add(value['output']['dates'][i]['date_user_id']);
          }
        });
      } else {
        print('user not found');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: DropdownButton(
                              value: areadropdown,
                              itemHeight: 50,
                              elevation: 0,
                              items: [
                                DropdownMenuItem(
                                    child: Text(
                                      'All Peoples',
                                      style: GoogleFonts.getFont(
                                        'Josefin Sans',
                                      ),
                                    ),
                                    value: 0),
                                DropdownMenuItem(
                                    child: Text(
                                      'My State',
                                      style: GoogleFonts.getFont(
                                        'Josefin Sans',
                                      ),
                                    ),
                                    value: 1),
                                DropdownMenuItem(
                                    child: Text(
                                      'My Country',
                                      style: GoogleFonts.getFont(
                                        'Josefin Sans',
                                      ),
                                    ),
                                    value: 2),
                                DropdownMenuItem(
                                    child: Text(
                                      'Whole World',
                                      style: GoogleFonts.getFont(
                                        'Josefin Sans',
                                      ),
                                    ),
                                    value: 3),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  areadropdown = int.parse(value.toString());
                                  print('areadropdown $areadropdown');
                                });
                              },
                            ),
                          ),
                          DropdownButton(
                            value: profiletype,
                            itemHeight: 50,
                            items: [
                              DropdownMenuItem(
                                  child: Text(
                                    'Common People',
                                    style: GoogleFonts.getFont(
                                      'Josefin Sans',
                                    ),
                                  ),
                                  value: 0),
                              DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Rich People',
                                        style: GoogleFonts.getFont(
                                          'Josefin Sans',
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.lock),
                                      )
                                    ],
                                  ),
                                  value: 1),
                              DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Super Rich',
                                        style: GoogleFonts.getFont(
                                          'Josefin Sans',
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.lock),
                                      )
                                    ],
                                  ),
                                  value: 2),
                            ],
                            onChanged: (value) {
                              setState(() {
                                profiletype = int.parse(value.toString());
                                print('profiletype $profiletype');
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  StreamBuilder(
                    stream: AllUserApi().otheruserdata({
                      if (areadropdown == 1) 'state': state,
                      if (areadropdown == 2) 'country': country,
                      if (profiletype == 1) 'profile_type': "rich_people",
                      if (profiletype == 2) 'profile_type': "super_rich",
                    }).asStream(), //productsStream(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          height: MediaQuery.of(context).size.height * .75,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  snapshot.data['output']['users'].length,
                              itemBuilder: (BuildContext context, int index) {
                                UserModel userdata = UserModel.fromJson(
                                    snapshot.data['output']['users'][index]);

                                if (checkignorecommon.contains(userdata.id) &&
                                    areadropdown == 0 &&
                                    profiletype == 0) {
                                  return Container();
                                } else {
                                  if (areadropdown == 0 && profiletype == 0) {
                                    print(userdata.bio);
                                    return datetile(userdata, index, false);
                                  } else {
                                    if (checkignorebyfilter
                                            .contains(userdata.id) ||
                                        checkdatebyfilter
                                            .contains(userdata.id)) {
                                      return Container();
                                    } else {
                                      return datetile(userdata, index, true);
                                    }
                                  }
                                }
                              }),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  Container(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .80,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 4)
                        ]),
                    child: Center(
                        child: Text(
                      'Profile displays remaining:  1',
                      style: GoogleFonts.getFont('Josefin Sans', fontSize: 18),
                    )),
                  ),
                  Container(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .80,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 4)
                        ]),
                    child: Center(
                        child: Text(
                      'Date clicks remaining:  1',
                      style: GoogleFonts.getFont('Josefin Sans', fontSize: 18),
                    )),
                  ),
                  Container(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget datetile(
      UserModel singledataofotheruser, int indexofuser, bool isfilter) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * .8,
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
              if (singledataofotheruser.images.length != 0)
                CarouselSlider(
                  options: CarouselOptions(
                      height: MediaQuery.of(context).size.width * .8,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentPos = index;
                        });
                      }),
                  items: singledataofotheruser.images.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          child: Image.network(
                              i['image'], //${index < 5 ? index + 1 : 2}.jpeg",
                              fit: BoxFit.fitHeight),
                        );
                      },
                    );
                  }).toList(),
                )
              else
                Container(
                  color: Colors.black12,
                  height: MediaQuery.of(context).size.width * .8,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text("User have no image"),
                  ),
                ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: singledataofotheruser.images.map((url) {
                    int index = singledataofotheruser.images.indexOf(url);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPos == index
                            ? Colors.black26
                            : Colors.grey[300], //.fromRGBO(0, 0, 0, 0.4),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 1.0, vertical: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (checkignorecommon
                              .contains(singledataofotheruser.id)) {
                            if (isfilter) {
                              checkignorebyfilter.add(singledataofotheruser.id);
                            }
                          } else {
                            IgnoreAndDate()
                                .ignoreadd(singledataofotheruser.id.toString())
                                .then((value) {
                              print(value);
                              if (value['statuscode'] == 200 &&
                                  value['success'] == 200) {
                                setState(() {
                                  checkignorecommon
                                      .add(singledataofotheruser.id);
                                  if (isfilter) {
                                    checkignorebyfilter
                                        .add(singledataofotheruser.id);
                                  }
                                  print(checkignorecommon.length);
                                  print(checkdatecommon.length);
                                });
                              } else {
                                print('user not found');
                              }
                            });
                          }
                        },
                        child: Container(
                          width: 130,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.red, Color(0xFFFFA07A)]),
                            boxShadow: [
                              BoxShadow(color: Color(0xFFFFA07A), blurRadius: 6)
                            ],

                            // color: Colors.red,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Ignore',
                                    style: GoogleFonts.getFont('Josefin Sans',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 24),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 10.0),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (checkdatecommon
                              .contains(singledataofotheruser.id)) {
                            if (isfilter) {
                              checkdatebyfilter.add(singledataofotheruser.id);
                            }
                          } else {
                            IgnoreAndDate()
                                .dateadd(singledataofotheruser.id.toString())
                                .then((value) {
                              if (value['statuscode'] == 200 &&
                                  value['success'] == 200) {
                                setState(() {
                                  checkdatecommon.add(singledataofotheruser.id);
                                  if (isfilter) {
                                    checkdatebyfilter
                                        .add(singledataofotheruser.id);
                                  }

                                  print(checkignorecommon.length);
                                  print(checkdatecommon.length);
                                });
                              } else {
                                print('user not found');
                              }
                            });
                          }
                        },
                        child: Container(
                          width: 130,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xFFADFF2F), Color(0xFF008000)]),
                            boxShadow: [
                              BoxShadow(color: Color(0xFFADFF2F), blurRadius: 6)
                            ],

                            // color: Colors.blue,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            child: Center(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 5, left: 20),
                                    child: Icon(
                                      Icons.favorite,
                                      size: 32,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Date',
                                      style: GoogleFonts.getFont('Josefin Sans',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 24),
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
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0, left: 8, top: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star),
                  Text(
                    '${singledataofotheruser.name}, ${singledataofotheruser.age}',
                    style: GoogleFonts.getFont('Josefin Sans',
                        color: Color(0xFF402BDB), fontSize: 34),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(
                      '${singledataofotheruser.state}, ${singledataofotheruser.country}',
                      style: GoogleFonts.getFont(
                        'Josefin Sans',
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 15,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(
                      'Bio-',
                      style: GoogleFonts.getFont(
                        'Josefin Sans',
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  child: Text(
                    singledataofotheruser.bio,
                    style: GoogleFonts.getFont(
                      'Josefin Sans',
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
