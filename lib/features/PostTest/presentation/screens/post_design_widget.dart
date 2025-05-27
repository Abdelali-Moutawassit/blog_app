import 'package:blog_app/features/PostTest/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget postWidget(PostEntity post) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                post.imageUrl,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.userName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  post.createdAt,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(post.content),
        SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(
                post.imageUrl,
              ),
            ),
            SizedBox(width: 5),
            Text("Liked by rebecca_jones and 155 others"),
          ],
        ),
        SizedBox(height: 5),
        Text("Tag someone you’d take here ❤️ Buon giorno ❤️"),
        SizedBox(height: 20),
        // Actions
        Row(
          children: [
            Icon(Icons.favorite_border, color: Colors.grey[700]),
            const SizedBox(width: 4),
            Text('253', style: GoogleFonts.poppins(fontSize: 13)),

            const SizedBox(width: 16),

            Icon(Icons.mode_comment_outlined, color: Colors.grey[700]),
            const SizedBox(width: 4),
            Text('20', style: GoogleFonts.poppins(fontSize: 13)),

            const SizedBox(width: 16),

            Icon(Icons.share_outlined, color: Colors.grey[700]),

            const Spacer(),

            Icon(Icons.bookmark_border, color: Colors.grey[700]),
          ],
        ),

        const SizedBox(height: 12),
        const Divider(thickness: 0.5),
        // Last Comment
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/men/71.jpg',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Amir Week",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "1ho ago",
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Very nice",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        // Comment boc
        Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/men/70.jpg',
              ), // à remplacer par l’utilisateur connecté
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  hintText: 'Ajouter un commentaire...',
                  hintStyle: GoogleFonts.poppins(fontSize: 13),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send, size: 20),
              onPressed: () {},
            ),
          ],
        ),
      ],
    ),
  );
}
