import 'package:dating_desire/constants/states.dart';
import 'package:dating_desire/constants/userdetails.dart';
import 'package:dating_desire/screens/preprofile.dart';
import 'package:dating_desire/services/signupapi.dart';
// ignore: unused_import
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signuppage3Widget extends StatefulWidget {
  final String countryname;
  final String phonenumberverified;
  final String stdcode;
  Signuppage3Widget(this.countryname, this.phonenumberverified, this.stdcode);

  @override
  _Signuppage3WidgetState createState() => _Signuppage3WidgetState();
}

class _Signuppage3WidgetState extends State<Signuppage3Widget> {
  TextEditingController textController1 = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  TextEditingController textController4 = TextEditingController();
  TextEditingController textController5 = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int agevalue = 0;
  int gendervalue = 0;
  String gender = 'None';
  int selectedage = 0;
  int index = 0;
  String statename = "";
  int statevalue = 0;
  bool passwordVisibility = false;

  bool agecheckbox = false;

  bool termconditioncheckbox = false;

  String address = "";
  List statedata = [];

  bool issubmitted = false;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    firstnamecontroller = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    passwordcontroller = TextEditingController();
    for (int i = 0; i < states['countries'].length; i++) {
      if (states['countries'][i]['country'] == widget.countryname) {
        print('match $i');
        setState(() {
          index = i;
          statedata = states['countries'][i]['states'];
        });
      }
    }
  }

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
              color: Colors.white,
            ),
            child: ListView(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.04, -0.49),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                        child: Text(
                          'Create New Account',
                          style: GoogleFonts.getFont(
                            'Josefin Sans',
                            color: Color(0xFF402BDB),
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Color(0xFF525050),
                            ),
                          ),
                          child: DropdownButtonFormField(
                            dropdownColor: Colors.white,
                            value: gendervalue,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            elevation: 0,
                            selectedItemBuilder: (BuildContext context) {
                              return [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12, 0, 0, 0),
                                      child: Image.asset(
                                        'assets/gender.png',
                                        width: 25,
                                        height: 25,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6.0),
                                      child: Text(
                                        'Gender',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12, 0, 0, 0),
                                      child: Image.asset(
                                        'assets/male.png',
                                        width: 25,
                                        height: 25,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6.0),
                                      child: Text(
                                        'Male',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12, 0, 0, 0),
                                      child: Image.asset(
                                        'assets/female.png',
                                        width: 25,
                                        height: 25,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6.0),
                                      child: Text(
                                        'Female',
                                      ),
                                    ),
                                  ],
                                ),
                              ];
                            },
                            items: [
                              DropdownMenuItem(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(12, 0, 0, 0),
                                        child: Image.asset(
                                          'assets/gender.png',
                                          width: 25,
                                          height: 25,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
                                        child: Text(
                                          'Gender',
                                        ),
                                      ),
                                    ],
                                  ),
                                  value: 0),
                              DropdownMenuItem(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(12, 0, 0, 0),
                                        child: Image.asset(
                                          'assets/male.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          'Male',
                                        ),
                                      ),
                                    ],
                                  ),
                                  value: 1),
                              DropdownMenuItem(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(12, 0, 0, 0),
                                        child: Image.asset(
                                          'assets/female.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          'Female',
                                        ),
                                      ),
                                    ],
                                  ),
                                  value: 2),
                            ],
                            onChanged: (value) {
                              List genderlist = ['None', 'Male', 'Female'];
                              setState(() {
                                gender =
                                    genderlist[int.parse(value.toString())];
                              });
                            },
                            // underline: Container(),
                          ),
                        ),
                        if (issubmitted && gender == 'None')
                          Text(
                            'Select Gender',
                            style: GoogleFonts.getFont(
                              'Josefin Sans',
                              color: Colors.red,
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Color(0xFF525050),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 4),
                                    child: TextFormField(
                                      controller: firstnamecontroller,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'First Name',
                                        hintStyle: GoogleFonts.getFont(
                                          'Josefin Sans',
                                          fontSize: 16,
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
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Josefin Sans',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          if (issubmitted &&
                              firstnamecontroller.text.length < 2)
                            Text(
                              'Name should be contain minimum 2 character',
                              style: GoogleFonts.getFont(
                                'Josefin Sans',
                                color: Colors.red,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Color(0xFF525050),
                              ),
                            ),
                            child: DropdownButtonFormField(
                              dropdownColor: Colors.white,
                              value: agevalue,
                              // itemHeight: 45,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIconConstraints:
                                    BoxConstraints(maxWidth: 35, maxHeight: 35),
                                prefixIcon: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Image.asset(
                                    'assets/gender.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                              elevation: 0,
                              items: [
                                DropdownMenuItem(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 6.0),
                                          child: Text(
                                            'Age',
                                          ),
                                        ),
                                      ],
                                    ),
                                    value: 0),
                                for (int i = 18; i <= 80; i++)
                                  DropdownMenuItem(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              '$i',
                                            ),
                                          ),
                                        ],
                                      ),
                                      value: i),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedage = int.parse(value.toString());
                                  print(value.toString());
                                  // _value1 = int.parse(value.toString());
                                });
                              },
                              // underline: Container(),
                            ),
                          ),
                          if (issubmitted && selectedage < 18)
                            Text(
                              'Age should be greater than 18',
                              style: GoogleFonts.getFont(
                                'Josefin Sans',
                                color: Colors.red,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Color(0xFF525050),
                          ),
                        ),
                        child: DropdownButtonFormField(
                          dropdownColor: Colors.white,
                          value: 0,
                          // itemHeight: 45,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          elevation: 0,
                          items: [
                            DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(12, 0, 0, 0),
                                        child: Icon(Icons.flag)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6.0),
                                      child: Text(
                                        widget.countryname,
                                      ),
                                    ),
                                  ],
                                ),
                                value: 0),
                          ],
                          onChanged: (value) {
                            setState(() {
                              // _value1 = int.parse(value.toString());
                            });
                          },
                          // underline: Container(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Color(0xFF525050),
                              ),
                            ),
                            child: DropdownButtonFormField(
                              dropdownColor: Colors.white,

                              value: statevalue,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIconConstraints:
                                    BoxConstraints(maxWidth: 35, maxHeight: 35),
                                prefixIcon: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Image.asset(
                                    'assets/home.png',
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                              ),
                              // itemHeight: 45,

                              elevation: 0,
                              items: [
                                DropdownMenuItem(
                                  child: Row(
                                    children: [
                                      /*Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                              child: Image.asset(
                                                'assets/home.png',
                                                width: 30,
                                                height: 30,
                                              ),
                                            ),*/
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
                                        child: Text(
                                          'State',
                                        ),
                                      ),
                                    ],
                                  ),
                                  value: 0,
                                ),
                                for (int i = 1;
                                    i <=
                                        statedata
                                            .length; //states['countries'][index]['states'].length;
                                    i++)
                                  DropdownMenuItem(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 6.0),
                                          child: Text(
                                            statedata[i - 1],
                                            //states['countries'][index]['states'][i - 1],
                                          ),
                                        ),
                                      ],
                                    ),
                                    value: i,
                                  ),
                              ],
                              onChanged: (value) {
                                if (value == 0) {
                                  setState(() {
                                    statename = "";
                                  });
                                } else {
                                  setState(() {
                                    for (int i = 1;
                                        i <=
                                            statedata
                                                .length; //states['countries'][index]['states'].length;
                                        i++) {
                                      print(statedata[
                                          int.parse(value.toString()) - 1]);
                                      statename = statedata[
                                          int.parse(value.toString()) - 1];
                                      break;
                                    }
                                    // _value1 = int.parse(value.toString());
                                  });
                                }
                              },
                              // underline: Container(),
                            ),
                          ),
                          if (issubmitted && statename.length == 0)
                            Text(
                              'Select State',
                              style: GoogleFonts.getFont(
                                'Josefin Sans',
                                color: Colors.red,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Color(0xFF525050),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        7, 0, 0, 4),
                                    child: TextFormField(
                                      controller: passwordcontroller,
                                      obscureText: !passwordVisibility,
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        hintStyle: GoogleFonts.getFont(
                                          'Josefin Sans',
                                        ),
                                        prefixIconConstraints: BoxConstraints(
                                            maxWidth: 35, maxHeight: 35),
                                        prefixIcon: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2, 0, 5, 0),
                                          child: Icon(
                                            Icons.lock,
                                            color: Colors.black,
                                            size: 24,
                                          ),
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
                                        suffixIcon: GestureDetector(
                                          onTap: () => setState(
                                            () => passwordVisibility =
                                                !passwordVisibility,
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
                                )
                              ],
                            ),
                          ),
                          if (issubmitted && passwordcontroller.text.length < 6)
                            Text(
                              'Password length should be minimum 6',
                              style: GoogleFonts.getFont(
                                'Josefin Sans',
                                color: Colors.red,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          CheckboxListTile(
                            value: agecheckbox,
                            onChanged: (newValue) =>
                                setState(() => agecheckbox = newValue!),
                            title: Text(
                              'I confirm that I am 18 years or above in age.',
                              style: GoogleFonts.getFont(
                                'Josefin Sans',
                              ),
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            dense: false,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          if (issubmitted && agecheckbox == false)
                            Text(
                              'Please Accept age checkbox',
                              style: GoogleFonts.getFont(
                                'Josefin Sans',
                                color: Colors.red,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          CheckboxListTile(
                            value: termconditioncheckbox,
                            onChanged: (newValue) => setState(() {
                              termconditioncheckbox = newValue!;
                            }),
                            title: Text(
                              'I accept the Terms & Conditions and Privacy Policy of Dating Desire.',
                              style: GoogleFonts.getFont(
                                'Josefin Sans',
                              ),
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            dense: false,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          if (issubmitted && termconditioncheckbox == false)
                            Text(
                              'Please Accept terms & conditions',
                              style: GoogleFonts.getFont(
                                'Josefin Sans',
                                color: Colors.red,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 30),
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            issubmitted = true;
                          });
                          if (agecheckbox &&
                              termconditioncheckbox &&
                              passwordcontroller.text.length >= 6 &&
                              firstnamecontroller.text.length >= 2 &&
                              statename.length != 0 &&
                              gender != 'None' &&
                              selectedage >= 18) {
                            print(widget.stdcode);
                            print(widget.phonenumberverified);
                            Map<String, dynamic> userdata = {
                              'name': firstnamecontroller.text,
                              'password': passwordcontroller.text,
                              'gender': gender,
                              'age': selectedage.toString(),
                              'country': widget.countryname,
                              'state': statename,
                              'std_code': widget.stdcode,
                              'phone': widget.phonenumberverified,
                              'profile_type': 'common_people',
                            };
                            SignUpApiService()
                                .register(userData: userdata)
                                .then((value) {
                              if (value['statuscode'] == 200) {
                                if (value['success'] == 200) {
                                  print(value['output']);
                                  setState(() {
                                    print(value['output']['user']['name']);
                                    name = value['output']['user']['name'];
                                    age = value['output']['user']['age']
                                        .toString();
                                    state = value['output']['user']['state'];
                                    country =
                                        value['output']['user']['country'];
                                    accesstoken =
                                        value['output']['access_token'];
                                    storeuserdata(accesstoken);
                                  });

                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) {
                                    return PreprofilepageWidget();
                                  }), (route) => false);
                                } else {}
                              } else {}
                            });
                          }
                        },
                        child: Container(
                          width: 270,
                          height: 45,
                          child: Center(
                            child: Text(
                              'Sign up',
                              style: GoogleFonts.getFont(
                                'Josefin Sans',
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF401BDB),
                            borderRadius: BorderRadius.circular(19),
                          ),
                        ),
                      ),
                    )
                    /*   ],
                      ),
                    )*/
                  ],
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
