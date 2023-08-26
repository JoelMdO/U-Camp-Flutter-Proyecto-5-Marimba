import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension MarimbaTextStyles on Text {
  Text marimbaTextStyles() {
    return Text(
      data!,
      style: GoogleFonts.mulish(
          fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
    );
  }
}
