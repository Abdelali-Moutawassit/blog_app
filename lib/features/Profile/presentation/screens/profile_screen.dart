import 'package:blog_app/features/Profile/presentation/widgets/followers_profile.dart';
import 'package:blog_app/features/Profile/presentation/widgets/images_profile.dart';
import 'package:blog_app/features/Profile/presentation/widgets/info_profile.dart';
import 'package:blog_app/features/Profile/presentation/widgets/navigation_profile.dart';
import 'package:blog_app/features/Profile/presentation/widgets/videos_profile.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/features/Profile/presentation/widgets/couverture_profile_widget.dart';
import 'package:blog_app/features/Profile/presentation/widgets/info_utilisateur_widget.dart';
import 'package:blog_app/features/Profile/presentation/widgets/list_posts_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 0;

  final List<String> tabs = ['Posts', 'Images', 'Videos', 'Followers', 'Info'];

  Widget getSelectedWidget() {
    switch (selectedIndex) {
      case 0:
        return listPostsProfile();
      case 1:
        return imagesProfile();
      case 2:
        return videosProfile();
      case 3:
        return followersProfile();
      case 4:
        return infoProfile(
          name: 'Yasmine B.',
          imageUrl: 'https://randomuser.me/api/portraits/women/12.jpg',
          bio: 'Passionnée par la photographie et les voyages.',
          isFollowing: true,
          onFollowPressed: () {},
          onMessagePressed: () {},
        );
      default:
        return listPostsProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // --- Image + intro ---
          couvertureProfileWidget(context, screenHeight, screenWidth),
          SliverToBoxAdapter(child: SizedBox(height: screenWidth * 0.01)),
          // --- Info User---
          infoUtilisateurWidget(screenWidth),
          // --- Onglets de navigation ---
          navigationProfile(
            selectedIndex: selectedIndex,
            onTabSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          // --- Affichage dynamique selon l'onglet ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: getSelectedWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
