import 'package:blog_app/features/PostTest/presentation/screens/post_design_widget.dart';
import 'package:blog_app/features/PostTest/presentation/cubit/post_cubit.dart';
import 'package:blog_app/features/PostTest/presentation/screens/create_post_card.dart';
import 'package:blog_app/features/Post/presentation/widgets/build_reels_section.dart';
import 'package:blog_app/features/Post/presentation/widgets/user_avatars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDesign extends StatelessWidget {
  final List<String> stories = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
  ];

  final List<String> storyNames = ['Fernanda', 'James', 'Estefania', 'Fan'];

  HomeDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit()..eitherFailureOrPosts(),
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xFFF9F9F9),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                  icon: Icon(Icons.search, color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.notifications_none, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
            body: Builder(
              builder: (context) {
                if (state is PostLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is PostFailure) {
                  return Center(child: Text((state as PostFailure).message));
                } else if (state is PostLoaded) {
                  final posts = (state as PostLoaded).posts;
                  return ListView(
                    padding: EdgeInsets.all(16),
                    children: [
                      UserAvatars(),
                      SizedBox(height: 5),
                      CreatePostCard(
                        profileImageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
                      ),
                      SizedBox(height: 20),
                      buildReelsSection(),
                      SizedBox(height: 20),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          return postWidget(posts[index]);
                        },
                      ),
                    ],
                  );
                } else {
                  return Center(child: Text("Unknown state"));
                }
              },
            ),
          );
        },
      ),
    );
  }
}
