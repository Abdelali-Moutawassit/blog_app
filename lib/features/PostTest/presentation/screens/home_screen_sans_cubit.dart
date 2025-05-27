import 'package:blog_app/features/Post/presentation/cubit/post_cubit.dart';
import 'package:blog_app/features/Post/presentation/widgets/build_post_card.dart';
import 'package:blog_app/features/Post/presentation/widgets/build_reels_section.dart';
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
            body: SafeArea(
              child: Stack(
                children: [
                  // -------- Scrollable content --------
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 60.0,
                    ), // Height of topBar
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      children: [
                        const SizedBox(height: 24),
                        const UserAvatars(),
                        const SizedBox(height: 24),

                        buildPostCard(
                          userName: "Amine Sow",
                          userImageUrl:
                              "https://randomuser.me/api/portraits/men/75.jpg",
                          postImageUrl:
                              "https://cdn.prod.website-files.com/651d66c14ac97bfbf614d2e5/651d66c14ac97bfbf614d6dc_What-is-dark-posting.jpeg",
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
                        const SizedBox(height: 24),

                        buildReelsSection(),
                        const SizedBox(height: 24),

                        buildPostCard(
                          userName: "Sami YG",
                          userImageUrl:
                              "https://randomuser.me/api/portraits/men/74.jpg",
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

                        buildPostCard(
                          userName: "Etoo MLO",
                          userImageUrl:
                              "https://randomuser.me/api/portraits/men/73.jpg",
                          postImageUrl:
                              "https://bernardmarr.com/wp-content/uploads/2023/04/The-Dark-Side-Of-Technology_-Navigating-The-Threat-Of-Digital-Impersonation.jpg",
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
                        const SizedBox(height: 24),

                        const CategoryCards(),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),

                  // -------- Fixed TopBar --------
                  // -------- Fixed TopBar --------
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            offset: const Offset(0, 2),
                            blurRadius: 6, // flou
                          ),
                        ],
                      ),
                      child: topBar(screenWidth,context),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
