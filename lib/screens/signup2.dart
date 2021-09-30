import 'package:dating_desire/screens/signup3.dart';
import 'package:dating_desire/services/signupapi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class Signup2Widget extends StatefulWidget {
  final String countryname;
  final String phonenumber;

  final String stdcode;
  Signup2Widget(this.countryname, this.phonenumber, this.stdcode);
  @override
  _Signup2WidgetState createState() => _Signup2WidgetState();
}

class _Signup2WidgetState extends State<Signup2Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String otppin = "";

  bool checkboxListTileValue = false;

  bool checkboxListTileValueerror = false;
  bool otperror = false;
  String otperrortext = "";
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 160, 0),
                  child: Text(
                    'We sent a code to:',
                    style: GoogleFonts.getFont(
                      'Josefin Sans',
                      color: Color(0xFFB93F1D),
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 200, 0),
                  child: Text(
                    "${widget.stdcode}${widget.phonenumber}",
                    style: GoogleFonts.getFont(
                      'Josefin Sans',
                      fontSize: 22,
                    ),
                  ),
                ),
                Column(
                  children: [
                    OTPTextField(
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: double.parse(
                          (MediaQuery.of(context).size.width / 8).toString()),
                      style: GoogleFonts.getFont('Josefin Sans', fontSize: 17),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.underline,
                      onCompleted: (pin) {
                        setState(() {
                          otppin = pin;
                          if (checkboxListTileValue) {
                            setState(() {
                              checkboxListTileValueerror = false;
                            });
                            SignUpApiService().verifyotp(userData: {
                              'phone': widget.phonenumber,
                              'otp': pin,
                              'std_code': widget.stdcode
                            }).then((value) {
                              if (value['statuscode'] == 200) {
                                if (value['success'] == 200 &&
                                    value['message'] ==
                                        "Successfully Verified") {
                                  setState(() {
                                    otperror = false;
                                    otperrortext = value['message'];
                                  });

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return Signuppage3Widget(
                                      widget.countryname,
                                      widget.phonenumber,
                                      widget.stdcode,
                                    );
                                  }));
                                } else {
                                  setState(() {
                                    otperror = true;
                                    otperrortext = value['message'];
                                  });
                                }
                              } else {
                                setState(() {
                                  otperror = true;
                                  otperrortext = value['message'];
                                });
                              }
                            });
                          } else {
                            print('entered');
                            setState(() {
                              checkboxListTileValueerror = true;
                            });
                          }
                        });
                      },
                    ),
                    if (otperror)
                      Text(
                        otperrortext,
                        style: GoogleFonts.getFont(
                          'Josefin Sans',
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 60, 10, 0),
                  child: Text(
                    'Resend in :  56',
                    style: GoogleFonts.getFont(
                      'Josefin Sans',
                      color: Color(0xFF402BDB),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 60, 3, 0),
                  child: Column(
                    children: [
                      if (checkboxListTileValueerror)
                        Text(
                          'Please accept privacy and policy',
                          style: GoogleFonts.getFont('Josefin Sans',
                              color: Colors.red),
                        ),
                      CheckboxListTile(
                        value: checkboxListTileValue,
                        onChanged: (newValue) {
                          setState(() => checkboxListTileValue = newValue!);
                          setState(() {
                            if (checkboxListTileValue) {
                              setState(() {
                                checkboxListTileValueerror = false;
                              });

                              print('length');
                              SignUpApiService().verifyotp(userData: {
                                'phone': widget.phonenumber,
                                'otp': otppin,
                                'std_code': widget.stdcode
                              }).then((value) {
                                if (value['statuscode'] == 200) {
                                  if (value['success'] == 200 &&
                                      value['message'] ==
                                          "Successfully Verified") {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                      return Signuppage3Widget(
                                        widget.countryname,
                                        widget.phonenumber,
                                        widget.stdcode,
                                      );
                                    }));
                                  } else {
                                    setState(() {
                                      otperror = true;
                                      otperrortext = value['message'];
                                    });
                                  }
                                } else {
                                  setState(() {
                                    otperror = true;
                                    otperrortext = value['message'];
                                  });
                                }
                              });
                            } else {
                              setState(() {
                                checkboxListTileValueerror = true;
                              });
                            }
                          });
                        },
                        title: Text(
                          'By signing in you agree to our Privary Policy\n& Terms of Service.',
                          style:
                              GoogleFonts.getFont('Josefin Sans', fontSize: 16),
                        ),
                        tileColor: Color(0xFFF5F5F5),
                        dense: false,
                        controlAffinity: ListTileControlAffinity.leading,
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
}
