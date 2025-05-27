import 'package:blog_app/features/Story/presentation/screens/story_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/features/Story/presentation/cubit/story_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

class UserAvatarsCubit extends StatelessWidget {
  const UserAvatarsCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoryCubit()..eitherFailureOrStories(),
      child: BlocBuilder<StoryCubit, StoryState>(
        builder: (context, state) {
          if (state is StoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StoryFailure) {
            return Center(child: Text(state.errorMessage));
          } else if (state is StoryLoaded) {
            final stories = state.stories;

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
                          builder: (_) => StoryViewerPage(
                            stories: stories
                                .map((e) => {
                                      'userName': e.login,
                                      'imageUrl': e.avatarUrl,
                                    })
                                .toList(),
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(story.avatarUrl),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          story.login,
                          style: GoogleFonts.poppins(fontSize: 10),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }

          return const SizedBox.shrink(); // état par défaut
        },
      ),
    );
  }
}
