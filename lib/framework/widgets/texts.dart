import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Output1 extends StatefulWidget {
  final String label;
  final String value;
  final double fontSize;
  
  Output1({Key key, this.label, this.value, this.fontSize=15}) : super(key: key);

  @override
  _Output1State createState() => _Output1State();
}

class _Output1State extends State<Output1> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text:widget.label,style: GoogleFonts.openSans(fontSize: widget.fontSize,fontWeight: FontWeight.w600,color: Colors.black),),
          TextSpan(text:widget.value.toString(),style: GoogleFonts.openSans(fontSize: widget.fontSize,fontWeight: FontWeight.w500,color: Colors.black),)
        ]
      ),
    );
  }
}