import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Modified_text extends StatelessWidget {
 final String? title;
 final double? size;
 final Color? color;

 Modified_text({ this.title,  this.size,  this.color});


  @override
  Widget build(BuildContext context) {
    return Text(
     title!,
     style: GoogleFonts.roboto(
      fontSize: size,
      color: color,
      letterSpacing: 2
     ),
    );
  }
}
