import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildPostCard({
  required String userName,
  required String userImageUrl,
  required String postImageUrl,
  String? songTitle,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Header - profil utilisateur
      Row(
        children: [
          CircleAvatar(radius: 22, backgroundImage: NetworkImage(userImageUrl)),
          const SizedBox(width: 10),
          Text(
            userName,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      const SizedBox(height: 10),
      Text(
        'His mother had always taught him',
        style: GoogleFonts.poppins(fontSize: 14),
      ),
      const SizedBox(height: 10),

      // Image principale du post
      ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Image.network(
          postImageUrl,
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
      ),

      // Titre de la chanson (si présent)
      if (songTitle != null && songTitle.isNotEmpty) ...[
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.music_note, size: 14, color: Colors.grey),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                songTitle,
                style: GoogleFonts.poppins(fontSize: 10, color: Colors.black87),
              ),
            ),
          ],
        ),
      ],

      const SizedBox(height: 12),

      // Boutons d'action (Like, Comment, Share, Save)
      Row(
        children: [
          IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.mode_comment_outlined),
            onPressed: () {},
          ),
          IconButton(icon: const Icon(Icons.share_outlined), onPressed: () {}),
          const Spacer(),
          IconButton(icon: const Icon(Icons.bookmark_border), onPressed: () {}),
        ],
      ),

      const SizedBox(height: 20),
    ],
  );
}
