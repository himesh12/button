import 'package:dating_desire/constants/colors.dart';
import 'package:dating_desire/constants/userdetails.dart';
import 'package:dating_desire/services/loginapi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'forgotpassword.dart';
import 'homescreen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool passwordVisibility = false;
  bool passworderror = false;
  bool numbererror = false;
  String passworderrortext = "";
  String numbererrortext = "";

  @override
  void initState() {
    super.initState();
    phonecontroller = TextEditingController();
    passwordcontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 24,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 200,
                  width: 200,
                ),
                Text(
                  'Sign In',
                  style: GoogleFonts.getFont(
                    'Josefin Sans',
                    color: Color(0xFFE24D4D),
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xFF656464),
                            width: 0.5,
                          ),
                        ),
                        child: Center(
                          child: TextFormField(
                            controller: phonecontroller,
                            keyboardType: TextInputType.phone,
                            obscureText: false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 18),
                              hintText: 'Phone number',
                              hintStyle: GoogleFonts.getFont(
                                'Josefin Sans',
                                color: Color(0xFF848383),
                                fontWeight: FontWeight.w600,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              prefixIcon: Icon(Icons.mobile_friendly),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: GoogleFonts.getFont(
                              'Josefin Sans',
                              color: Color(0xFF848383),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      if (numbererror)
                        Text(
                          numbererrortext,
                          style: GoogleFonts.getFont(
                            'Josefin Sans',
                            color: Colors.red,
                          ),
                        )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xFF656464),
                            width: 0.5,
                          ),
                        ),
                        child: TextFormField(
                          controller: passwordcontroller,
                          obscureText: !passwordVisibility,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 18),
                            hintText: 'Password',
                            hintStyle: GoogleFonts.getFont(
                              'Josefin Sans',
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 26,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () => setState(
                                () => passwordVisibility = !passwordVisibility,
                              ),
                              child: Icon(
                                passwordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Color(0xFF757575),
                                size: 22,
                              ),
                            ),
                          ),
                          style: GoogleFonts.getFont(
                            'Josefin Sans',
                          ),
                        ),
                      ),
                      if (passworderror)
                        Text(
                          passworderrortext,
                          style: GoogleFonts.getFont(
                            'Josefin Sans',
                            color: Colors.red,
                          ),
                        )
                    ],
                  ),
                ),
              
                       
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: GestureDetector(
                    onTap: () {
                      if (phonecontroller.text.length == 0) {
                        setState(() {
                          numbererror = true;
                          numbererrortext = "Enter phone number";
                        });
                      } else {
                        if (passwordcontroller.text.length < 6) {
                          setState(() {
                            passworderror = true;
                            passworderrortext = "Password length minimum 6";
                          });
                          print("Password must be 6 character");
                        } else {
                          LoginApiService().userLogin(userData: {
                            'phone': phonecontroller.text,
                            'password': passwordcontroller.text
                          }).then((value) {
                            if (value['statuscode'] == 200) {
                              if (value['success'] == 200 &&
                                  value['message'] == "Login Sucessfully") {
                                setState(() {
                                  print(value['output']['user']['name']);
                                  name = value['output']['user']['name'];
                                  age =
                                      value['output']['user']['age'].toString();
                                  bio = value['output']['user']['bio'] == null
                                      ? ""
                                      : value['output']['user']['bio'];
                                  state = value['output']['user']['state'];
                                  country = value['output']['user']['country'];
                                  accesstoken = value['output']['access_token'];

                                  storeuserdata(
                                      value['output']['access_token']);
                                });

                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                  return HomeScreen();
                                }), (route) => false);
                              } else {
                                if (value['message'] == "Password mismatch") {
                                  setState(() {
                                    passworderror = true;
                                    passworderrortext = value['message'];
                                  });
                                } else {
                                  setState(() {
                                    passworderror = false;
                                    passworderrortext = "";
                                  });
                                }
                                if (value['message'] == "User does not exist") {
                                  setState(() {
                                    numbererror = true;
                                    numbererrortext = value['message'];
                                  });
                                } else {
                                  setState(() {
                                    numbererror = false;
                                    numbererrortext = "";
                                  });
                                }
                              }
                            } else {
                              setState(() {
                                numbererror = true;
                                numbererrortext = value['message'];
                              });
                            }
                          });
                        }
                      }
                    },
                    
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        color: Color(0xFFF45F5F),
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
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return ForgotpasswordWidget();
                          }));
                        },
                        child: Text(
                          'Forgot Your Password ?',
                          style: GoogleFonts.getFont(
                            'Josefin Sans',
                            color: blue,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  storeuserdata(String usertoken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('usertoken', usertoken);
    await prefs.setBool('userloggedin', true);
  }
}
