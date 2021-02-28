import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

const Color primaryColor = Color(0XFF4F8BFE);
const Color whiteColor = Color(0XFFFFFFFF);

const int $deg = 0x00B0;

TextStyle tempText = GoogleFonts.roboto(
  textStyle:
      TextStyle(fontWeight: FontWeight.bold, fontSize: 100, color: whiteColor),
);

TextStyle header = GoogleFonts.roboto(
  textStyle:
      TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: whiteColor),
);

TextStyle title = GoogleFonts.roboto(
  textStyle:
      TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: whiteColor),
);

TextStyle subTitle = GoogleFonts.roboto(
  textStyle:
      TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: whiteColor),
);
