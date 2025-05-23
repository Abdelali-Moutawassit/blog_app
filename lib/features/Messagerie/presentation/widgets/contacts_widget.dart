import 'package:flutter/material.dart';
import 'package:blog_app/db/messagriePage/contacts_db.dart';
import 'package:google_fonts/google_fonts.dart';

Widget contactWidget() {
  return SizedBox(
    height: 80,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: contacts.length,
      separatorBuilder: (context, _) => const SizedBox(width: 16),
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return Column(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundImage: NetworkImage(contact['image'] as String),
            ),
            const SizedBox(height: 6),
            Text(
              contact['name'] as String,
              style: GoogleFonts.poppins(fontSize: 12),
            ),
          ],
        );
      },
    ),
  );
}
