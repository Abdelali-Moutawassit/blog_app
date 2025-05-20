import 'package:blog_app/features/Post/presentation/cubit/post_cubit.dart';
import 'package:blog_app/features/Post/presentation/widgets/bottom_navigation_bar.dart';
import 'package:blog_app/features/Post/presentation/widgets/build_post_card.dart';
import 'package:blog_app/features/Post/presentation/widgets/category_cards.dart';
import 'package:blog_app/features/Post/presentation/widgets/user_avatars.dart';
import 'package:blog_app/features/Post/presentation/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => PostCubit(),
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: bottomNavigationBar(),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10,
                ),
                child: ListView(
                  children: [
                    const SizedBox(height: 10),
                    // Top Bar
                    topBar(screenWidth),
                    const SizedBox(height: 24),
                    // User avatars widget
                    const UserAvatars(),
                    const SizedBox(height: 24),
                    
                    // Posts
                    buildPostCard(
                      userName: "Amine Sow",
                      userImageUrl:
                          "https://randomuser.me/api/portraits/men/75.jpg",
                      postImageUrl:
                          "https://cdn.prod.website-files.com/651d66c14ac97bfbf614d2e5/651d66c14ac97bfbf614d6dc_What-is-dark-posting.jpeg",
                      songTitle: "Blinding Lights - The Weeknd",
                    ),
                    buildPostCard(
                      userName: "Sami YG",
                      userImageUrl:
                          "https://randomuser.me/api/portraits/men/74.jpg",
                      postImageUrl:
                          "https://static.wixstatic.com/media/fa0097_0634970820354e0ab05774119bdce676~mv2.jpg/v1/fill/w_1000,h_514,al_c,q_85,usm_0.66_1.00_0.01/fa0097_0634970820354e0ab05774119bdce676~mv2.jpg",
                      songTitle: "Blinding Lights - The Weeknd",
                    ),
                    buildPostCard(
                      userName: "Etoo MLO",
                      userImageUrl:
                          "https://randomuser.me/api/portraits/men/73.jpg",
                      postImageUrl:
                          "https://bernardmarr.com/wp-content/uploads/2023/04/The-Dark-Side-Of-Technology_-Navigating-The-Threat-Of-Digital-Impersonation.jpg",
                      songTitle: "Blinding Lights - The Weeknd",
                    ),
                    const SizedBox(height: 24),
                    // Category cards
                    const SizedBox(height: 12),
                    const CategoryCards(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
