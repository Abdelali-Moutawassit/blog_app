import 'package:blog_app/pagesFake/Story_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserAvatars extends StatelessWidget {
  const UserAvatars({super.key});

  @override
  Widget build(BuildContext context) {
    final userList = [
      'Emilia',
      'Richard',
      'Jasmine',
      'Lucas',
      'Ava',
      'Show',
      'Look',
    ];

    final stories =
        userList
            .asMap()
            .entries
            .map(
              (entry) => {
                'userName': entry.value,
                'imageUrl': 'https://i.pravatar.cc/150?img=${entry.key + 10}',
              },
            )
            .toList();

    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final story = stories[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => StoryViewerPage(stories: stories),
                ),
              );
            },
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(story['imageUrl']!),
                ),
                const SizedBox(height: 4),
                Text(
                  story['userName']!,
                  style: GoogleFonts.poppins(fontSize: 10),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
