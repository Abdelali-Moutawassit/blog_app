import 'package:blog_app/features/Post/presentation/cubit/post_cubit.dart';
import 'package:blog_app/features/Post/presentation/widgets/build_post_card.dart';
import 'package:blog_app/features/Post/presentation/widgets/build_reels_section.dart';
import 'package:blog_app/features/Post/presentation/widgets/category_cards.dart';
import 'package:blog_app/features/Post/presentation/widgets/top_bar.dart';
import 'package:blog_app/features/Post/presentation/widgets/user_avatars_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => PostCubit()..eitherFailureOrPosts(),
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      children: [
                        const SizedBox(height: 24),
                        const UserAvatarsCubit(),
                        const SizedBox(height: 24),

                        if (state is PostLoading) ...[
                          const Center(child: CircularProgressIndicator()),
                        ] else if (state is PostFailure) ...[
                          Center(child: Text(state.message)),
                        ] else if (state is PostLoaded) ...[
                          for (var post in state.posts) 
                            buildPostCard(
                              userName: "Sami YG",  // statique
                              userImageUrl: "https://randomuser.me/api/portraits/men/74.jpg", // statique
                              postImageUrl:
                                  "https://static.wixstatic.com/media/fa0097_0634970820354e0ab05774119bdce676~mv2.jpg/v1/fill/w_1000,h_514,al_c,q_85,usm_0.66_1.00_0.01/fa0097_0634970820354e0ab05774119bdce676~mv2.jpg", // statique
                              songTitle: post.title, // dynamique ici
                              reactionsCount: 245,  // statique
                              commentsCount: 12,    // statique
                              lastCommentUserName: "Meriem", // statique
                              lastCommentText: "Ce post est génial ! ❤️", // statique
                              postDate: "2h ago", // statique
                              postText: "Un petit moment de détente 😌", // statique
                              lastCommentUserImage:
                                  "https://randomuser.me/api/portraits/men/50.jpg", // statique
                              lastCommentDate: "1h", // statique
                            ),
                        ],

                        const SizedBox(height: 24),
                        buildReelsSection(),
                        const SizedBox(height: 24),

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
                            blurRadius: 6,
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