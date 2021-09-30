/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutGaefta extends StatefulWidget {
  _AboutGaeftaState createState() => _AboutGaeftaState();
}

class _AboutGaeftaState extends State<AboutGaefta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/gaeftalogo2.svg',
                height: MediaQuery.of(context).size.width * .7,
                width: MediaQuery.of(context).size.width * .7,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'A product of Gaefta',
                  style: GoogleFonts.getFont('Josefin Sans',
                      fontSize: 24, color: Colors.black),
                ),
              ),
              Text(
                'We Believe in innovation',
                style: GoogleFonts.getFont('Josefin Sans',
                    fontSize: 24, color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/googleplay.png',
                        height: MediaQuery.of(context).size.width * .5,
                        width: MediaQuery.of(context).size.width * .5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Text(
                          'Trending on PlayStore',
                          style: GoogleFonts.getFont('Josefin Sans',
                              fontSize: 24, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/applestore.png',
                          height: MediaQuery.of(context).size.width * .5,
                          width: MediaQuery.of(context).size.width * .5),
                      Container(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Text(
                          'Trending on AppleStore',
                          style: GoogleFonts.getFont('Josefin Sans',
                              fontSize: 24, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
*/