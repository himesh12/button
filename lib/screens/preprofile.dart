import 'dart:io';

import 'package:dating_desire/constants/userdetails.dart';
// ignore: unused_import
import 'package:dating_desire/services/signupapi.dart';
import 'package:dating_desire/services/updateuserdetails.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'homescreen.dart';

class PreprofilepageWidget extends StatefulWidget {
  @override
  _PreprofilepageWidgetState createState() => _PreprofilepageWidgetState();
}

class _PreprofilepageWidgetState extends State<PreprofilepageWidget> {
  TextEditingController biocontroller = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late File _image;
  bool imagebool = false;
  bool issubmitted = false;
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

    setState(() {});
  }

  Future<Null> _cropImage(filePath, int indexofimage) async {
    File croppedImage = await ImageCropper.cropImage(
            sourcePath: filePath,
            compressFormat: ImageCompressFormat.png,
            aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0))
        .then((value) => File(value!.path));
    // ignore: unnecessary_null_comparison
    if (croppedImage != null) {
      //  setState(() {
      if (indexofimage == 1) {
        _image = croppedImage;
        setState(() {
          imagebool = true;
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
  void initState() {
    super.initState();

    biocontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (!imagebool && issubmitted)
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Profile pic should be upload',
                      style: GoogleFonts.getFont('Josefin Sans',
                          color: Colors.red),
                    ),
                  ),
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

                                      if (imagebool)
                                        Image.file(_image)
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
                                            Image.file(_image2)
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
                                            Image.file(_image4)
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
                                            Image.file(_image3)
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
                                            Image.file(_image5)
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
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 100,
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Padding(
                        padding: EdgeInsets.only(),
                        child: TextField(
                          controller: biocontroller,
                          maxLines: 5,
                          style: GoogleFonts.getFont(
                            'Josefin Sans',
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type your bio here !!!',
                              hintStyle: GoogleFonts.getFont(
                                'Josefin Sans',
                              ),
                              contentPadding: EdgeInsets.only(
                                top: 0,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {
                        issubmitted = true;
                      });
                      if (imagebool) {
                        Map<String, dynamic> userdata = {
                          'bio': biocontroller.text,
                          if (imagebool)
                            'image1': await MultipartFile.fromFile(
                              _image.path,
                            ),
                          if (imagebool2)
                            'image2':
                                await MultipartFile.fromFile(_image2.path),
                          if (imagebool3)
                            'image3':
                                await MultipartFile.fromFile(_image3.path),
                          if (imagebool4)
                            'image4':
                                await MultipartFile.fromFile(_image4.path),
                          if (imagebool5)
                            'image5':
                                await MultipartFile.fromFile(_image5.path),
                        };
                        ApiUpdateDetails()
                            .updatedetails(
                          userData: userdata,
                        )
                            .then((value) {
                          if (value['statuscode'] == 200) {
                            if (value['success'] == 200) {
                              setState(() {
                                bio = biocontroller.text;
                              });
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                return HomeScreen();
                              }), (route) => false);
                            } else {}
                          } else {}
                        });
                      }
                    },
                    child: Container(
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xFF402BDB),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          'Start Dating',
                          style: GoogleFonts.getFont(
                            'Josefin Sans',
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
