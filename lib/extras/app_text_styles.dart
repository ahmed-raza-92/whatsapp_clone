import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle{

  static TextStyle robot({TextStyle? style}){
    return GoogleFonts.roboto(
      textStyle: style,
    );
  }

}