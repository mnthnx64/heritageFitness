import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isDisabled;

  const PrimaryButton({Key key, this.text, this.onPressed, this.isDisabled = false}) : super(key: key);

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.isDisabled ? null : widget.onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        primary: Color(0xFFE87514),
        onPrimary: Colors.white,
        // color: Color(0xFFE87514),
        // textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      child: Text(
        widget.text,
        style: GoogleFonts.openSans(fontSize: 16,fontWeight: FontWeight.bold,letterSpacing: 0.6),
      ),
    );
  }
}
