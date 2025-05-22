import 'package:blog_app/features/Profile/presentation/widgets/build_post_card_profile.dart';
import 'package:flutter/material.dart';

Widget listPostsProfile() {
  return Column(
    children: [
      const SizedBox(height: 20),
      buildPostCardProfile(
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
        lastCommentUserImage: "https://randomuser.me/api/portraits/men/50.jpg",
        lastCommentDate: "1h",
      ),
      const SizedBox(height: 10),
      buildPostCardProfile(
        userName: "Lina",
        userImageUrl: "https://randomuser.me/api/portraits/women/43.jpg",
        postImageUrl:
            "https://images.unsplash.com/photo-1544717305-2782549b5136",
        songTitle: "Calm Vibes - Chillhop",
        reactionsCount: 180,
        commentsCount: 8,
        lastCommentUserName: "Younes",
        lastCommentText: "Wach hadchi f casa ? 🔥",
        postDate: "3h ago",
        postText: "Ma nouvelle routine capillaire 🌿",
        lastCommentUserImage: "https://randomuser.me/api/portraits/men/25.jpg",
        lastCommentDate: "2h",
      ),
    ],
  );
}
