/*import 'package:flutter/material.dart';

class PreprofilepageWidget extends StatefulWidget {
  @override
  _PreprofilepageWidgetState createState() => _PreprofilepageWidgetState();
}

class _PreprofilepageWidgetState extends State<PreprofilepageWidget> {
  TextEditingController textController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
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
                              child: Container(
                                width: MediaQuery.of(context).size.width * .50,
                                height: MediaQuery.of(context).size.width * .50,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xFF6A6868),
                                  size: 24,
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
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .24,
                                    height:
                                        MediaQuery.of(context).size.width * .24,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xFF6A6868),
                                      size: 24,
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
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .24,
                                    height:
                                        MediaQuery.of(context).size.width * .24,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xFF6A6868),
                                      size: 24,
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
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .24,
                                    height:
                                        MediaQuery.of(context).size.width * .24,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xFF6A6868),
                                      size: 24,
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
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .24,
                                    height:
                                        MediaQuery.of(context).size.width * .24,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xFF6A6868),
                                      size: 24,
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
                        style: TextStyle(
                          fontFamily: 'Poppins',
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
                        style: TextStyle(
                          fontFamily: 'Poppins',
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
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 18, 3, 0),
                      child: Text(
                        'BIO-',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF858181),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: TextField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                        /*TextFormField(
                          controller: textController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: '\'This is my bio\' !',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
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
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                        ),
                 */
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
                  child: InkWell(
                    onTap: () {
                      print('Button pressed ...');
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
                          style: TextStyle(
                            fontFamily: 'Poppins',
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
*/