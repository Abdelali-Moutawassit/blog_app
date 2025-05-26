import 'package:blog_app/design/create_post_card.dart';
import 'package:blog_app/design/post_design_widget.dart';
import 'package:blog_app/features/Post/presentation/cubit/post_cubit.dart';
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
      create: (context) => PostCubit(),
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
            body: ListView(
              padding: EdgeInsets.all(16),
              children: [
                // Stories
                UserAvatars(),
                SizedBox(height: 5),
                // Create Post Card
                CreatePostCard(
                  profileImageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
                ),
                SizedBox(height: 20),
                buildReelsSection(),
                SizedBox(height: 20),
                // Post
                postWidget(),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                                "Angelina Hall",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "2 hours ago",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "I have just spent 3 amazing days in my home town! 😍",
                      ),
                      SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
                            ),
                          ),
                          SizedBox(width: 5),
                          Text("Liked by rebecca_jones and 155 others"),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Tag someone you’d take here ❤️ Buon giorno ❤️ FOLLOW",
                      ),
                      Text("dirkhensiek_hh: Very nice"),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                                "Angelina Hall",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "2 hours ago",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "I have just spent 3 amazing days in my home town! 😍",
                      ),
                      SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBZjmRd6fUkEG7W_2s8gqD8y6W8qqPiAur-g&s',
                            ),
                          ),
                          SizedBox(width: 5),
                          Text("Liked by rebecca_jones and 155 others"),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Tag someone you’d take here ❤️ Buon giorno ❤️ FOLLOW",
                      ),
                      Text("dirkhensiek_hh: Very nice"),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
