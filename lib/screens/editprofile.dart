import 'dart:io';

import 'package:dating_desire/constants/colors.dart';
import 'package:dating_desire/constants/userdetails.dart';
import 'package:dating_desire/screens/homescreen.dart';
import 'package:dating_desire/screens/profilepage.dart';
import 'package:dating_desire/services/updateuserdetails.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class EditprofilepageWidget extends StatefulWidget {
  @override
  _EditprofilepageWidgetState createState() => _EditprofilepageWidgetState();
}

class _EditprofilepageWidgetState extends State<EditprofilepageWidget> {
  late AudioCache _audioCache;
  TextEditingController namecontroller =
      TextEditingController(text: name.toString());
  TextEditingController biocontroller =
      TextEditingController(text: bio.toString());

  final scaffoldKey = GlobalKey<ScaffoldState>();

  String ok9 = "";

  @override
  void initState() {
    super.initState();
    namecontroller = TextEditingController(text: name.toString());
    biocontroller = TextEditingController(text: bio.toString());
  }

  late File _image1;
  bool imagebool1 = false;
  bool namechange = false;
  bool biochange = false;

  bool imagebool2 = false;
  bool imagebool3 = false;
  bool imagebool4 = false;
  bool imagebool5 = false;
  late File _image2;
  late File _image3;
  late File _image4;
  late File _image5;
  final picker = ImagePicker();
  Future setImage(int indexofimage) async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    _cropImage(pickedFile!.path, indexofimage);

    setState(() {
      // _image = File(pickedFile!.path);
    });
    // await setimg();
  }

  Future<Null> _cropImage(filePath, int indexofimage) async {
    File croppedImage = await ImageCropper.cropImage(
            compressFormat: ImageCompressFormat.png,
            sourcePath: filePath,
            aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0))
        .then((value) => File(value!.path));

    // ignore: unnecessary_null_comparison
    if (croppedImage != null) {
      //  setState(() {
      if (indexofimage == 1) {
        _image1 = croppedImage;
        setState(() {
          imagebool1 = true;
        });
      } else {
        if (indexofimage == 2) {
          _image2 = croppedImage;
          setState(() {
            imagebool2 = true;
          });
        } else {
          if (indexofimage == 3) {
            _image3 = croppedImage;
            setState(() {
              imagebool3 = true;
            });
          } else {
            if (indexofimage == 4) {
              _image4 = croppedImage;
              setState(() {
                imagebool4 = true;
              });
            } else {
              if (indexofimage == 5) {
                _image5 = croppedImage;
                setState(() {
                  imagebool5 = true;
                });
              }
            }
          }
        }
      }
      //  });
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 35.0),
            child: Text(
              'Edit Profile',
              style: GoogleFonts.getFont(
                'Josefin Sans',
                color: Color(0xFF402BDB),
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  //  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(),
                              child: GestureDetector(
                                onTap: () {
                                  print('upload your profile pic');
                                  setImage(1);
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .50,
                                  height:
                                      MediaQuery.of(context).size.width * .50,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                  child: Stack(
                                    children: [
//if (_image.path == null)

                                      if (imagebool1)
                                        Center(child: Image.file(_image1))
                                      else if (userimage.containsKey('1'))
                                        Center(
                                            child: Image.network(
                                                userimage['1'].toString()))
                                      else
                                        Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.add,
                                                color: Color(0xFF6A6868),
                                                size: 24,
                                              ),
                                              Text(
                                                'This is your Profile Picture',
                                                style: GoogleFonts.getFont(
                                                    'Josefin Sans',
                                                    color: Colors.black54),
                                              )
                                            ],
                                          ),
                                        ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '1',
                                            style: GoogleFonts.getFont(
                                                'Josefin Sans',
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .01,
                                    bottom:
                                        MediaQuery.of(context).size.width * .01,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      print('upload your profile pic');
                                      setImage(2);
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          .24,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              .24,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      child: Stack(
                                        children: [
//if (_image2.path != null)
                                          if (imagebool2)
                                            Center(child: Image.file(_image2))
                                          else if (userimage.containsKey('2'))
                                            Center(
                                                child: Image.network(
                                                    userimage['2'].toString()))
                                          else
                                            Center(
                                              child: Icon(
                                                Icons.add,
                                                color: Color(0xFF6A6868),
                                                size: 24,
                                              ),
                                            ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                '2',
                                                style: GoogleFonts.getFont(
                                                    'Josefin Sans',
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .01,
                                    top:
                                        MediaQuery.of(context).size.width * .01,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      print('upload your profile pic');
                                      setImage(4);
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          .24,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              .24,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      child: Stack(
                                        children: [
                                          if (imagebool4)
                                            Center(child: Image.file(_image4))
                                          else if (userimage.containsKey('4'))
                                            Center(
                                                child: Image.network(
                                                    userimage['4']))
                                          else
                                            Center(
                                              child: Icon(
                                                Icons.add,
                                                color: Color(0xFF6A6868),
                                                size: 24,
                                              ),
                                            ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                '4',
                                                style: GoogleFonts.getFont(
                                                    'Josefin Sans',
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .01,
                                    bottom:
                                        MediaQuery.of(context).size.width * .01,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      print('upload your profile pic');
                                      setImage(3);
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          .24,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              .24,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      child: Stack(
                                        children: [
                                          if (imagebool3)
                                            Center(child: Image.file(_image3))
                                          else if (userimage.containsKey('3'))
                                            Center(
                                                child: Image.network(
                                                    userimage['3']))
                                          else
                                            Center(
                                              child: Icon(
                                                Icons.add,
                                                color: Color(0xFF6A6868),
                                                size: 24,
                                              ),
                                            ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                '3',
                                                style: GoogleFonts.getFont(
                                                    'Josefin Sans',
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .01,
                                    top:
                                        MediaQuery.of(context).size.width * .01,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      print('upload your profile pic');
                                      setImage(5);
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          .24,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              .24,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      child: Stack(
                                        children: [
                                          if (imagebool5)
                                            Center(child: Image.file(_image5))
                                          else if (userimage.containsKey('5'))
                                            Center(
                                                child: Image.network(
                                                    userimage['5'].toString()))
                                          else
                                            Center(
                                              child: Icon(
                                                Icons.add,
                                                color: Color(0xFF6A6868),
                                                size: 24,
                                              ),
                                            ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                '5',
                                                style: GoogleFonts.getFont(
                                                    'Josefin Sans',
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 25, 33, 0),
                  child: Row(
                    children: [
                      Text(
                        'Post your best updated photos here',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.getFont(
                          'Josefin Sans',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 18, 0),
                  child: Row(
                    children: [
                      Text(
                        'Click to change or delete photos. Drag photos to change order',
                        style: GoogleFonts.getFont(
                          'Josefin Sans',
                          color: Color(0xFF868484),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 8,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13, right: 8),
                      child: Text(
                        'Name-',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.getFont(
                          'Josefin Sans',
                          color: Color(0xFF858181),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.82,
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: TextFormField(
                        controller: namecontroller,
                        onChanged: (a) {
                          setState(() {
                            namechange = true;
                          });
                        },
                        style: GoogleFonts.getFont(
                          'Josefin Sans',
                        ),
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13, right: 8, top: 2),
                      child: Text(
                        'BIO-',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.getFont(
                          'Josefin Sans',
                          color: Color(0xFF858181),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.82,
                      //   height: 100,
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .03),
                        child: TextField(
                          controller: biocontroller,
                          maxLines: 5,
                          onChanged: (a) {
                            setState(() {
                              biochange = true;
                            });
                          },
                          style: GoogleFonts.getFont(
                            'Josefin Sans',
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                top: 0,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20, top: 70),
                  child: GestureDetector(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                      splashColor: Colors.grey,
                
                    
                    onTap: () async {
                      
                      Map<String, dynamic> userdata = {
                        if (biochange) 'bio': biocontroller.text,
                        if (namechange) 'name': namecontroller.text,
                        if (imagebool1)
                          'image1': await MultipartFile.fromFile(
                            _image1.path,
                          ),
                        if (imagebool2)
                          'image2': await MultipartFile.fromFile(_image2.path),
                        if (imagebool3)
                          'image3': await MultipartFile.fromFile(_image3.path),
                        if (imagebool4)
                          'image4': await MultipartFile.fromFile(_image4.path),
                        if (imagebool5)
                          'image5': await MultipartFile.fromFile(_image5.path),
                      };
     
                      ApiUpdateDetails()
                          .updatedetails(
                        userData: userdata,
                      )
                          .then((value) {
                        if (value['statuscode'] == 200) {
                          if (value['success'] == 200) {
                            setState(() {
                              if (biochange) bio = biocontroller.text;
                              if (namechange) name = namecontroller.text;
                            });
                             
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return HomeScreen(
                                initial: 2,
                                
                              );
                              
                            }),
                           
                             (route) => false);
                          } else {}
                        } else {}
                      });
                        _audioCache.play('U5K3HD8-clicl.mp3');
                    },
                    
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 12, spreadRadius: 4, color: blue)
                          ]),
                      child: Center(
                        child: Text(
                          'Update',
                          style: GoogleFonts.getFont(
                            'Josefin Sans',
                            color: blue,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
    );
  }

 onLongPress() {}
}

mixin _audioCache {
  static void play(String s) {}
}
