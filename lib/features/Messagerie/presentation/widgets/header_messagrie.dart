import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget headerMessagrie() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Messages',
        style: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      const Icon(Icons.bar_chart, size: 26),
    ],
  );
}
