import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildPostCardProfile({
  required String userName,
  required String userImageUrl,
  required String postImageUrl,
  required String songTitle,
  required int reactionsCount,
  required int commentsCount,
  required String lastCommentUserName,
  required String lastCommentText,
  required String postDate,
  required String postText,
  required String lastCommentUserImage,
  required String lastCommentDate,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header utilisateur
          ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(userImageUrl)),
            title: Text(
              userName,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(postDate, style: GoogleFonts.poppins(fontSize: 12)),
          ),
          // Image post
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(postImageUrl, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(postText, style: GoogleFonts.poppins(fontSize: 14)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.favorite, size: 16, color: Colors.red),
                    const SizedBox(width: 4),
                    Text(
                      '$reactionsCount',
                      style: GoogleFonts.poppins(fontSize: 13),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.comment, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      '$commentsCount',
                      style: GoogleFonts.poppins(fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: NetworkImage(lastCommentUserImage),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$lastCommentUserName • $lastCommentDate",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            lastCommentText,
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
