import 'package:flutter/material.dart';
import 'package:blog_app/features/Post/presentation/widgets/build_icon_button.dart';
import 'package:google_fonts/google_fonts.dart';

Widget topBar(screenWidth) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "BlogApp",
        style: GoogleFonts.poppins(
          fontSize: screenWidth > 600 ? 28 : 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      Row(
        children: [
          buildIconButton(icon: Icons.notifications_none, onTap: () {}),
          const SizedBox(width: 12),
          buildIconButton(icon: Icons.chat_bubble_outline, onTap: () {}),
        ],
      ),
    ],
  );
}
