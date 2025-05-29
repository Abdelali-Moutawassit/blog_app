import 'package:blog_app/features/PostTest/domain/entities/sub_entities/comment_entity.dart';
import 'package:blog_app/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildPostCard({
  required String userName,
  required String userImageUrl,
  required String postImageUrl,
  required String postDate,
  bool isPublic = true,
  String? postText,
  String? songTitle,
  int reactionsCount = 0,
  int commentsCount = 0,
  List<CommentEntity>? comments,
}) {
  return SizedBox(
    height: 580,
    child: Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------- HEADER --------
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(userImageUrl),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            postDate,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(width: 6),
                          Icon(
                            isPublic ? Icons.public : Icons.lock,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
              ],
            ),

            const SizedBox(height: 12),

            // -------- TEXTE DU POST --------
            if (postText != null && postText.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(postText, style: GoogleFonts.poppins(fontSize: 14)),
              ),

            // -------- IMAGE DU POST --------
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                postImageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),

            // -------- CHANSON --------
            if (songTitle != null && songTitle.isNotEmpty) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.music_note, size: 16, color: Colors.grey),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      songTitle,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 12),

            // -------- ACTIONS --------
            Row(
              children: [
                Icon(Icons.favorite_border, color: Colors.grey[700]),
                const SizedBox(width: 4),
                Text(
                  '$reactionsCount',
                  style: GoogleFonts.poppins(fontSize: 13),
                ),

                const SizedBox(width: 16),

                Icon(Icons.mode_comment_outlined, color: Colors.grey[700]),
                const SizedBox(width: 4),
                Text(
                  '$commentsCount',
                  style: GoogleFonts.poppins(fontSize: 13),
                ),

                const SizedBox(width: 16),

                Icon(Icons.share_outlined, color: Colors.grey[700]),
                const Spacer(),
                Icon(Icons.bookmark_border, color: Colors.grey[700]),
              ],
            ),

            const SizedBox(height: 12),
            const Divider(thickness: 0.5),

            // -------- LISTE DE COMMENTAIRES --------
            if (comments != null && comments.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final comment = comments[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Avatar à gauche
                          CircleAvatar(
                            radius: 16,
                            backgroundImage: NetworkImage(
                              comment.profileImageUrl,
                            ),
                          ),
                          const SizedBox(width: 8),

                          // Contenu + icônes dans une row qui prend le reste de la largeur
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Partie texte
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            comment.userName,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13,
                                            ),
                                          ),
                                          const SizedBox(width: 6),
                                          Text(
                                            formatDateTime(comment.createdAt),
                                            style: GoogleFonts.poppins(
                                              fontSize: 11,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        comment.content,
                                        style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.reply, size: 18),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        // comment.isLiked ? Icons.favorite : Icons.favorite_border,
                                        // size: 18,
                                        // color: comment.isLiked ? Colors.red : Colors.grey,
                                        Icons.favorite_border,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

            // -------- AJOUTER UN COMMENTAIRE --------
            // const Divider(thickness: 0.5),
            // Row(
            //   children: [
            //     const CircleAvatar(
            //       radius: 16,
            //       backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/70.jpg'),
            //     ),
            //     const SizedBox(width: 8),
            //     Expanded(
            //       child: TextField(
            //         decoration: InputDecoration(
            //           contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            //           hintText: 'Ajouter un commentaire...',
            //           hintStyle: GoogleFonts.poppins(fontSize: 13),
            //           filled: true,
            //           fillColor: Colors.grey[100],
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(20),
            //             borderSide: BorderSide.none,
            //           ),
            //         ),
            //       ),
            //     ),
            //     IconButton(
            //       icon: const Icon(Icons.send, size: 20),
            //       onPressed: () {
            //         // Implémente l'envoi ici
            //       },
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    ),
  );
}
