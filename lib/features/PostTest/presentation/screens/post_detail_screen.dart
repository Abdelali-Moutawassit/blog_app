import 'package:blog_app/features/Music/presentation/screens/music_screen.dart';
import 'package:blog_app/features/PostTest/presentation/widgets/build_post_card_nv.dart';
import 'package:blog_app/features/PostTest/domain/entities/post_entity.dart';
import 'package:blog_app/features/PostTest/presentation/widgets/styled_icon_button.dart';
import 'package:blog_app/features/Profile/presentation/screens/profile_screen.dart';
import 'package:blog_app/pagesFake/notification_page.dart';
import 'package:flutter/material.dart';
// import 'widgetsFake/build_post_card.dart';

class PostDetailScreen extends StatelessWidget {
  final PostEntity post;
  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://media.istockphoto.com/id/527343577/photo/looking-for-inspiration.jpg?s=612x612&w=0&k=20&c=ck3lswRHkRpvxurShBPaRj5dvieSo1N0ZPqXA4XdOnk=',
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "James Adams",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "@james_adams",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
            styledIconButton(
              iconAsset: 'assets/images/mus.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MusicScreen()),
                );
              },
              count: 5,
            ),
            styledIconButton(
              iconAsset: 'assets/images/not.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                );
              },
              count: 3,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildPostCard(
            userName: post.userName,
            userImageUrl: post.profileImageUrl,
            postImageUrl: post.imageUrl,
            postDate: post.createdAt,
            comments: post.comments,
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/men/70.jpg',
                  ),
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
                      // hintStyle: GoogleFonts.poppins(fontSize: 13),
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
                  onPressed: () {
                    // Implémente l'envoi ici
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
