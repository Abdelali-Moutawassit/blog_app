import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // --- Couverture + photo profil ---
          SliverToBoxAdapter(
            child: Stack(
              children: [
                SizedBox(
                  height: screenHeight * 0.35,
                  width: double.infinity,
                  child: PageView(
                    children: [
                      Image.network(
                        'https://res.cloudinary.com/jerrick/image/upload/d_642250b563292b35f27461a7.png,f_jpg,q_auto,w_720/6734c53e768161001d967de6.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Image.network(
                        'https://res.cloudinary.com/jerrick/image/upload/d_642250b563292b35f27461a7.png,f_jpg,q_auto,w_720/6734c8df768161001d967e26.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Image.network(
                        'https://i.pinimg.com/236x/68/6a/95/686a956701f6201ed8e9b77ffc25fd33.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh_W0lVO3NROOEnzAFgH8ENVGsyydvLvbDaM2DTkN3oX6z2xDf7-dSFNEOvl-GjnijiFs&usqp=CAU',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),

                // Barre d'actions superposée en haut (flèche, coeur, 3 points)
                Positioned(
                  top: 40,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.favorite_border,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          PopupMenuButton<String>(
                            icon: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                            ),
                            onSelected: (value) {
                            },
                            itemBuilder: (BuildContext context) {
                              return [
                                const PopupMenuItem<String>(
                                  value: 'details',
                                  child: Text('En savoir plus'),
                                ),
                              ];
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: screenHeight * 0.12,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black.withValues(alpha: 0.3), Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: -screenWidth * 0.0001,
                  left: (screenWidth - screenWidth * 0.24) / 2,
                  child: CircleAvatar(
                    radius: screenWidth * 0.12,
                    backgroundImage: const NetworkImage(
                      'https://randomuser.me/api/portraits/men/65.jpg',
                    ),
                  ),
                ),
              ],
            ),
          ),

          // --- Espacement sous le profil ---
          SliverToBoxAdapter(child: SizedBox(height: screenWidth * 0.01)),

          // --- Nom d'utilisateur + intro ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Nom
                  Text(
                    'Daja',
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Boutons Appeler et Message sous le nom, icônes rondes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white,
                          child: const Icon(
                            Icons.call,
                            color: Colors.black,
                            size: 28,
                          ),
                        ),
                      ),

                      const SizedBox(width: 24),

                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white,
                          child: const Icon(
                            Icons.message,
                            color: Colors.black,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Métier + Adresse
                  Text(
                    'Makeup Artist • Casablanca, Maroc',
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.035,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 8),

                  // Étoile unique + nombre d’avis
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, size: 18, color: Colors.amber),
                      const SizedBox(width: 8),
                      Text(
                        '4.9 (128 avis)',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Description personnelle (même taille, style changé)
                  Text(
                    "Passionnée par la mise en valeur naturelle de chaque visage. Avec plus de 6 ans d'expérience, je propose des prestations sur mesure pour sublimer votre beauté à chaque occasion.",
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.036,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // --- Liste des posts (remplace serviceCard) ---
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),
              buildPostCard(
                userName: "Sami YG",
                userImageUrl: "https://randomuser.me/api/portraits/men/74.jpg",
                postImageUrl:
                    "https://static.wixstatic.com/media/fa0097_0634970820354e0ab05774119bdce676~mv2.jpg/v1/fill/w_1000,h_514,al_c,q_85,usm_0.66_1.00_0.01/fa0097_0634970820354e0ab05774119bdce676~mv2.jpg",
                songTitle: "Blinding Lights - The Weeknd",
                reactionsCount: 245,
                commentsCount: 12,
                lastCommentUserName: "Meriem",
                lastCommentText: "Ce post est génial ! ❤️",
                postDate: "2h ago",
                postText: "Un petit moment de détente 😌",
                lastCommentUserImage:
                    "https://randomuser.me/api/portraits/men/50.jpg",
                lastCommentDate: "1h",
              ),
              const SizedBox(height: 10),
              buildPostCard(
                userName: "Lina",
                userImageUrl:
                    "https://randomuser.me/api/portraits/women/43.jpg",
                postImageUrl:
                    "https://images.unsplash.com/photo-1544717305-2782549b5136",
                songTitle: "Calm Vibes - Chillhop",
                reactionsCount: 180,
                commentsCount: 8,
                lastCommentUserName: "Younes",
                lastCommentText: "Wach hadchi f casa ? 🔥",
                postDate: "3h ago",
                postText: "Ma nouvelle routine capillaire 🌿",
                lastCommentUserImage:
                    "https://randomuser.me/api/portraits/men/25.jpg",
                lastCommentDate: "2h",
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

// --- Widget Post Card ---
Widget buildPostCard({
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
