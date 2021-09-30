import 'package:flutter/cupertino.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            )),
      ),
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
            ],
          ),
        ),
      ),
    );
  }
}
