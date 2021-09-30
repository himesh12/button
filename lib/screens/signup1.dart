import 'package:dating_desire/constants/iso.dart';
import 'package:dating_desire/screens/signup2.dart';
import 'package:dating_desire/services/signupapi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Signuppage1Widget extends StatefulWidget {
  @override
  _Signuppage1WidgetState createState() => _Signuppage1WidgetState();
}

class _Signuppage1WidgetState extends State<Signuppage1Widget> {
  String dropDownValue = '+91';
  TextEditingController phonecontroller = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String isocode = "IN";
  int phonecontrollerlength = 10;
  bool phonenumberlengtherror = false;
  String phonenumbererrortext = "";

  @override
  void initState() {
    super.initState();
    phonecontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          size: 40,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Color(0xFF402BDB),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(26, 21, 0, 0),
                            child: Text(
                              'Let\'s verify your phone number',
                              style: GoogleFonts.getFont(
                                'Josefin Sans',
                                color: Color(0xFF402BDB),
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 22, 0),
                            child: Text(
                              'Dating Desire only allows contact \nnumber to sign up so that only real\nprofiles are available for users to \ninteract. ',
                              style: GoogleFonts.getFont(
                                'Josefin Sans',
                                color: Color(0xFF514F4F),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 19, 19, 30),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xFF4026DB),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 8),
                                child: IntlPhoneField(
                                  onCountryChanged: (value) {
                                    setState(() {
                                      isocode = value.countryISOCode.toString();
                                      dropDownValue =
                                          value.countryCode.toString();
                                      phonecontrollerlength =
                                          countries.firstWhere((element) =>
                                                  element['code'] ==
                                                  value.countryISOCode)[
                                              'max_length'];
                                    });
                                  },
                                  controller: phonecontroller,
                                  style: GoogleFonts.getFont(
                                    'Josefin Sans',
                                    color: Color(0xFF303030),
                                  ),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '    Mobile  Number',
                                    hintStyle: GoogleFonts.getFont(
                                      'Josefin Sans',
                                      color: Color(0xFF303030),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 20)),
                                    contentPadding: EdgeInsets.only(top: 25),
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
                                  ),
                                  iconPosition: IconPosition.trailing,
                                  initialCountryCode: 'IN',
                                  onChanged: (phone) {},
                                ),
                              ),
                            ),
                            if (phonenumberlengtherror)
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      phonenumbererrortext,
                                      style: GoogleFonts.getFont(
                                        'Josefin Sans',
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 30, 0, 0),
                        child: GestureDetector(
                          onTap: () async {
                            print('tap');
                            for (int i = 0; i < iso.length; i++) {
                              if (iso[i]['code'] == isocode) {
                                print(
                                    'hola ${phonecontroller.text.length == phonecontrollerlength}');
                                if (phonecontroller.text.length ==
                                    phonecontrollerlength) {
                                  SignUpApiService().sendotponnumber(userData: {
                                    'phone': phonecontroller.text,
                                    'std_code': dropDownValue
                                  }).then((value) {
                                    print(value);
                                    if (value['statuscode'] == 200) {
                                      print('dfs');
                                      if (value['success'] == 200 &&
                                          value['message'] ==
                                              "OTP has been sent to your mobile number") {
                                        print('done');
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                          return Signup2Widget(
                                              iso[i]['name'],
                                              phonecontroller.text,
                                              "$dropDownValue");
                                        }));
                                      } else {
                                        if (value['success'] == 422) {
                                          setState(() {
                                            phonenumberlengtherror = true;
                                            phonenumbererrortext =
                                                "Phone number already registered";
                                          });
                                        } else {
                                          setState(() {
                                            phonenumberlengtherror = true;
                                            phonenumbererrortext =
                                                value['message'];
                                          });
                                        }
                                      }
                                    } else {
                                      if (value['success'] == 422) {
                                        setState(() {
                                          phonenumberlengtherror = true;
                                          phonenumbererrortext =
                                              "Phone number already registered";
                                        });
                                      } else {
                                        setState(() {
                                          phonenumberlengtherror = true;
                                          phonenumbererrortext =
                                              value['message'];
                                        });
                                      }
                                    }
                                  });

                                  break;
                                } else {
                                  print('here');
                                  setState(() {
                                    phonenumberlengtherror = true;
                                    phonenumbererrortext =
                                        "Enter a valid number";
                                  });
                                }
                              } else {
                                // print('something wrong');
                              }
                            }
                            /* */
                          },
                          child: Container(
                            width: 325,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xFF402BDB),
                                borderRadius: BorderRadius.circular(19)),
                            child: Center(
                              child: Text(
                                'Continue',
                                style: GoogleFonts.getFont(
                                  'Josefin Sans',
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(19, 20, 0, 0),
                        child: Text(
                          'Note: Your contact number will not be visible to any other user, It is only used to verify you as a real person.',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            color: Color(0xFFDD3E3E),
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * .8,
                          child: Center(
                            child: Text(
                              'We will need to verify your mobile number to ensure the security and trust that our community is known for. We will send an SMS confirmation to verify your mobile number by an OTP.Message and data rates may apply.',
                              style: GoogleFonts.getFont(
                                'Josefin Sans',
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      )
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
